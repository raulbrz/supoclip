# Use Node.js as the base image (using debian instead of alpine for better compatibility)
FROM node:18-slim AS base

# Install OpenSSL for Prisma
RUN apt-get update && apt-get install -y openssl && rm -rf /var/lib/apt/lists/*

# Dependencies stage
FROM base AS deps
WORKDIR /app

# Copy package.json and lock files
COPY package.json package-lock.json ./
RUN npm install --include=dev

# Builder stage
FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Create generated directory and generate Prisma client
RUN mkdir -p src/generated && npx prisma generate

# Build the Next.js app
ENV NEXT_TELEMETRY_DISABLED=1
RUN npm run build

# Runner stage
FROM base AS runner
WORKDIR /app

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1

# Create a non-root user
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# Copy the built application
COPY --from=builder /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs

EXPOSE 3000

ENV PORT=3000
ENV HOSTNAME="0.0.0.0"

# Start the application
CMD ["node", "server.js"]
