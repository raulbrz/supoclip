# 🚀 Guia de Configuração - SupoClip

Este guia te ajudará a configurar o SupoClip para substituir o OpusClipe.

## 📋 Pré-requisitos

- Docker e Docker Compose instalados
- Chaves de API para serviços de IA (OpenAI, Google, AssemblyAI, etc.)

## 🔧 Configuração Inicial

### 1. Configurar Variáveis de Ambiente

1. Copie o arquivo de exemplo:
```bash
cp env.example .env
```

2. Edite o arquivo `.env` e configure as seguintes variáveis essenciais:

```env
# Chaves de API obrigatórias
OPENAI_API_KEY="sua-chave-openai"
GOOGLE_API_KEY="sua-chave-google"
ASSEMBLY_AI_API_KEY="sua-chave-assemblyai"

# Chave secreta para autenticação (gere uma chave segura)
BETTER_AUTH_SECRET="sua-chave-secreta-super-segura"

# URLs (ajuste conforme necessário)
DATABASE_URL="postgresql+asyncpg://supoclip:supoclip_password@postgres:5432/supoclip"
NEXT_PUBLIC_API_URL="http://localhost:8000"
NEXT_PUBLIC_APP_URL="http://localhost:3000"
```

### 2. Iniciar os Serviços

```bash
# Construir e iniciar todos os serviços
docker-compose up --build

# Ou em modo detached (background)
docker-compose up --build -d
```

### 3. Verificar se os Serviços Estão Funcionando

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:8000
- **Documentação da API**: http://localhost:8000/docs

## 🗄️ Banco de Dados

O banco PostgreSQL será inicializado automaticamente com:
- Usuário: `supoclip`
- Senha: `supoclip_password`
- Database: `supoclip`

O script `init.sql` criará todas as tabelas necessárias automaticamente.

## 🎯 Funcionalidades Principais

### ✅ O que está funcionando:
- ✅ Autenticação de usuários (Better Auth)
- ✅ Upload de vídeos
- ✅ Download de vídeos do YouTube
- ✅ Transcrição com AssemblyAI
- ✅ Análise de IA para encontrar melhores clipes
- ✅ Geração de clipes com transições
- ✅ Customização de fontes
- ✅ Interface web responsiva

### 🔄 Processo de Geração de Clipes:
1. Upload de vídeo ou URL do YouTube
2. Transcrição automática
3. Análise de IA para identificar segmentos relevantes
4. Geração de clipes com transições
5. Download dos clipes gerados

## 🛠️ Solução de Problemas

### Problema: Erro de conexão com banco de dados
```bash
# Verificar se o PostgreSQL está rodando
docker-compose logs postgres

# Reiniciar apenas o banco
docker-compose restart postgres
```

### Problema: Erro de chaves de API
- Verifique se todas as chaves de API estão configuradas no `.env`
- Teste as chaves individualmente nos serviços

### Problema: Erro de permissões de arquivo
```bash
# Dar permissões para o diretório de logs
sudo chmod -R 755 logs/
```

### Problema: Frontend não conecta com backend
- Verifique se `NEXT_PUBLIC_API_URL` está correto
- Verifique se o backend está rodando na porta 8000

## 📊 Monitoramento

### Logs dos Serviços:
```bash
# Ver logs de todos os serviços
docker-compose logs -f

# Ver logs de um serviço específico
docker-compose logs -f backend
docker-compose logs -f frontend
docker-compose logs -f postgres
```

### Health Checks:
- Backend: http://localhost:8000/health/db
- Frontend: http://localhost:3000

## 🚀 Deploy em Produção

Para produção, configure:

1. **Variáveis de ambiente seguras**:
   - Use chaves de API reais
   - Configure `BETTER_AUTH_SECRET` com uma chave forte
   - Use URLs de produção

2. **Banco de dados**:
   - Configure um PostgreSQL externo
   - Use credenciais seguras

3. **Domínio**:
   - Configure `NEXT_PUBLIC_APP_URL` com seu domínio
   - Configure `NEXT_PUBLIC_API_URL` com a URL da API

## 🔄 Migração do OpusClipe

O SupoClip oferece funcionalidades similares ao OpusClipe:
- ✅ Processamento de vídeos do YouTube
- ✅ Upload de vídeos locais
- ✅ Geração automática de clipes
- ✅ Interface web moderna
- ✅ Autenticação de usuários
- ✅ Customização de fontes e estilos

## 📞 Suporte

Se encontrar problemas:
1. Verifique os logs: `docker-compose logs -f`
2. Verifique as variáveis de ambiente
3. Verifique se todas as dependências estão instaladas
4. Reinicie os serviços: `docker-compose restart`
