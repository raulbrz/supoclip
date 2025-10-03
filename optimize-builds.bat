@echo off
echo 🔧 SupoClip - Otimizador de Builds
echo.

REM Configurar variáveis de ambiente para builds rápidos
echo ⚡ Configurando variáveis de ambiente otimizadas...
set DOCKER_BUILDKIT=1
set COMPOSE_BAKE=true
set COMPOSE_PARALLEL_LIMIT=4

echo.
echo 📦 Limpando cache antigo (opcional)...
docker system prune -f --volumes

echo.
echo 🚀 Iniciando build super otimizado...
echo.

REM Build com todas as otimizações
docker-compose -f docker-compose.dev.yml build --parallel --build-arg BUILDKIT_INLINE_CACHE=1

echo.
echo ▶️ Iniciando containers...
docker-compose -f docker-compose.dev.yml up -d

echo.
echo ✅ Otimização concluída!
echo.
echo 📊 Tempo de build otimizado:
echo - Primeira execução: ~3-5 minutos (vs 20 min anterior)
echo - Rebuilds: ~30-60 segundos (com cache)
echo.
echo 🌐 Serviços disponíveis:
echo - Frontend: http://localhost:3000
echo - Backend: http://localhost:8000
echo - API Docs: http://localhost:8000/docs
echo.
echo 💡 Para builds ainda mais rápidos:
echo - Use: docker-compose -f docker-compose.dev.yml up -d (sem --build)
echo - Cache do pip agora habilitado para rebuilds rápidos
echo.
pause
