--DDL
CREATE DATABASE db_devconnect;
GO

USE db_devconnect;
GO

--tabela usuario
CREATE TABLE tb_usuario(
id INT IDENTITY (1,1) PRIMARY KEY,
nome_completo NVARCHAR(255) NOT NULL,
nome_usuario NVARCHAR(50) UNIQUE NOT NULL,
email NVARCHAR(255) UNIQUE NOT NULL,
senha NVARCHAR(50) NOT NULL,
foto_perfil_url NVARCHAR(150) NULL
);

SELECT * FROM tb_usuario;

--tabela publicacao
CREATE TABLE tb_publicacao(
id INT IDENTITY (1,1) PRIMARY KEY,
id_usuario INT NOT NULL,
descricao NVARCHAR(100) NOT NULL,
imagem_url NVARCHAR(150) NULL,
data_publicacao DATE NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id)
);

SELECT * FROM tb_publicacao;

--tabela curtida
CREATE TABLE tb_curtida(
id_usuario INT NOT NULL,
id_publicacao INT NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id),
FOREIGN KEY (id_publicacao) REFERENCES tb_publicacao(id),
);

SELECT * FROM tb_curtida;

--tabela comentario
CREATE TABLE tb_comentario(
id INT IDENTITY(1,1) PRIMARY KEY,
texto NVARCHAR(255) NOT NULL,
data_comentario DATETIME NOT NULL,
id_usuario INT NOT NULL,
id_publicacao INT NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id),
FOREIGN KEY (id_publicacao) REFERENCES tb_publicacao(id),
);

SELECT * FROM tb_comentario;

--tabela seguidor
CREATE TABLE tb_seguidor(
id_usuario_seguidor INT NOT NULL,
id_usuario_seguido INT NOT NULL,
PRIMARY KEY (id_usuario_seguidor, id_usuario_seguido),
FOREIGN KEY (id_usuario_seguidor) REFERENCES tb_usuario(id),
FOREIGN KEY (id_usuario_seguido) REFERENCES tb_usuario(id),
);

SELECT * FROM tb_seguidor;
