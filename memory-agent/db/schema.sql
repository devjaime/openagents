-- Memory Agent Schema for Supabase/PostgreSQL

-- Tabla principal de conversaciones
CREATE TABLE IF NOT EXISTS conversations (
    id BIGSERIAL PRIMARY KEY,
    session_id TEXT NOT NULL,
    user_id TEXT,  -- identificador del usuario (ej: telegram:1540433103)
    role TEXT NOT NULL CHECK (role IN ('user', 'assistant', 'system')),
    content TEXT NOT NULL,
    metadata JSONB DEFAULT '{}',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Índice para búsquedas por sesión
CREATE INDEX IF NOT EXISTS idx_conversations_session 
    ON conversations(session_id, created_at DESC);

-- Índice para búsquedas por usuario
CREATE INDEX IF NOT EXISTS idx_conversations_user 
    ON conversations(user_id, created_at DESC);

-- Tabla de embeddings (usa pgvector)
CREATE TABLE IF NOT EXISTS message_embeddings (
    id BIGSERIAL PRIMARY KEY,
    conversation_id BIGINT NOT NULL REFERENCES conversations(id) ON DELETE CASCADE,
    embedding vector(1536) NOT NULL,  -- OpenAI ada-002 dimensions
    model TEXT DEFAULT 'text-embedding-ada-002',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Índice para búsqueda vectorial
CREATE INDEX IF NOT EXISTS idx_embeddings_cosine 
    ON message_embeddings USING ivfflat (embedding vector_cosine_ops);

-- Tabla de sesiones
CREATE TABLE IF NOT EXISTS sessions (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    title TEXT,
    summary TEXT,
    context JSONB DEFAULT '{}',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Función para buscar conversaciones similares
CREATE OR REPLACE FUNCTION search_conversations(
    p_query TEXT,
    p_user_id TEXT DEFAULT NULL,
    p_limit INT DEFAULT 5
)
RETURNS TABLE (
    id BIGINT,
    session_id TEXT,
    role TEXT,
    content TEXT,
    similarity FLOAT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.id,
        c.session_id,
        c.role,
        c.content,
        1 - (e.embedding <=> (
            SELECT embedding FROM openai_embedding($1)
        )) as similarity
    FROM conversations c
    JOIN message_embeddings e ON c.id = e.conversation_id
    WHERE (p_user_id IS NULL OR c.user_id = p_user_id)
    ORDER BY e.embedding <=> (
        SELECT embedding FROM openai_embedding($1)
    )
    LIMIT p_limit;
END;
$$ LANGUAGE plpgsql;

-- Función para crear embedding (stub - implementar con OpenAI API)
CREATE OR REPLACE FUNCTION openai_embedding(text)
RETURNS vector(1536) AS $$
BEGIN
    -- TODO: Implementar llamada a OpenAI API
    -- Por ahora retorna vector cero
    RETURN '0'::vector(1536);
END;
$$ LANGUAGE plpgsql;

-- Tabla de configuración
CREATE TABLE IF NOT EXISTS agent_memory_config (
    user_id TEXT PRIMARY KEY,
    system_prompt TEXT,
    memory_enabled BOOLEAN DEFAULT true,
    context_window INT DEFAULT 10,  -- últimos N mensajes
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Insertar config por defecto para Jaime
INSERT INTO agent_memory_config (user_id, memory_enabled, context_window)
VALUES ('telegram:1540433103', true, 10)
ON CONFLICT (user_id) DO NOTHING;
