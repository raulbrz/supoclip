@echo off
echo 🚀 SupoClip - Build Otimizado para Velocidade
echo.

REM Habilitar BuildKit para builds mais rápidos
set DOCKER_BUILDKIT=1
set COMPOSE_BAKE=true

echo ⚡ Configurações otimizadas:
echo - DOCKER_BUILDKIT=1 (BuildKit habilitado)
echo - COMPOSE_BAKE=true (Build paralelo)
echo - Cache do pip habilitado
echo.

echo 🔨 Iniciando build otimizado...
echo.

REM Build com cache e paralelização
docker-compose -f docker-compose.dev.yml up --build -d

echo.
echo ✅ Build concluído!
echo.
echo 📊 Status dos containers:
docker-compose -f docker-compose.dev.yml ps

echo.
echo 🌐 Acesse:
echo - Frontend: http://localhost:3000
echo - Backend API: http://localhost:8000
echo - API Docs: http://localhost:8000/docs
echo.
echo 💡 Para rebuilds futuros, use: docker-compose -f docker-compose.dev.yml up -d
echo    (muito mais rápido com cache habilitado!)
pause
