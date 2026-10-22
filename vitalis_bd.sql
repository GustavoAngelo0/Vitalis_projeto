CREATE TABLE IF NOT EXISTS Usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    perfil VARCHAR(50) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Pacientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_nascimento DATE,
    endereco TEXT,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Medicos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR(20) UNIQUE NOT NULL,
    especialidade VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Consultas (
    id SERIAL PRIMARY KEY,
    paciente_id INT REFERENCES Pacientes(id),
    medico_id INT REFERENCES Medicos(id),
    data_hora TIMESTAMP NOT NULL,
    status VARCHAR(50) DEFAULT 'Agendada',
    observacoes TEXT
);

CREATE TABLE IF NOT EXISTS Prontuarios (
    id SERIAL PRIMARY KEY,
    paciente_id INT REFERENCES Pacientes(id),
    medico_id INT REFERENCES Medicos(id),
    consulta_id INT REFERENCES Consultas(id),
    descricao TEXT NOT NULL,
    receita TEXT,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Financeiro (
    id SERIAL PRIMARY KEY,
    consulta_id INT REFERENCES Consultas(id),
    tipo VARCHAR(20) NOT NULL, 
    descricao VARCHAR(150) NOT NULL,
    valor NUMERIC(10, 2) NOT NULL,
    data_transacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Estoque (
    id SERIAL PRIMARY KEY,
    item VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    lote VARCHAR(50),
    validade DATE
);
