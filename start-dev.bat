@echo off
echo 🚀 Iniciando SupoClip em modo desenvolvimento...
echo.

echo 📦 Parando containers existentes...
docker-compose -f docker-compose.dev.yml down

echo.
echo 🔨 Construindo e iniciando serviços...
docker-compose -f docker-compose.dev.yml up --build

echo.
echo ✅ SupoClip está rodando!
echo 🌐 Frontend: http://localhost:3000
echo 🔧 Backend API: http://localhost:8000
echo 📚 Documentação: http://localhost:8000/docs
echo.
pause
