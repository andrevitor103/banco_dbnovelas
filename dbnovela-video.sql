CREATE TABLE `tbator` (
  `codigo_ator` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome_ator` varchar(20) NOT NULL,
  `idade_ator` int(11) NOT NULL,
  `cidade_ator` varchar(20) NOT NULL,
  `salario_ator` double NOT NULL,
  `sexo_ator` char(1) DEFAULT NULL
);


INSERT INTO `tbator` (`codigo_ator`, `nome_ator`, `idade_ator`, `cidade_ator`, `salario_ator`, `sexo_ator`) VALUES
(1, 'Howe', 95, 'North Cowichan', 1430, 'M'),
(2, 'Benton', 23, 'Neuss', 14282, 'M'),
(3, 'Daugherty', 52, 'Feltre', 10649, 'M'),
(4, 'Santos', 46, 'Padre Hurtado', 4834, 'M'),
(5, 'Fernando Souza', 89, 'Dehri', 9719, 'M'),
(6, 'Warner', 22, 'Richmond', 20541, 'F'),
(7, 'Sanders', 29, 'Malbaie', 13458, 'F'),
(8, 'Ford', 38, 'Kelso', 21784, 'F'),
(9, 'Kim', 39, 'Judenburg', 16338, 'F'),
(10, 'Ayers', 46, 'Port Moody', 10277, 'F'),
(11, 'Maria', 20, 'irati', 1000, 'F');


CREATE TABLE `tbnovela` (
  `codigo_novela` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome_novela` varchar(30) NOT NULL,
  `data_primeiro_capitulo` date NOT NULL,
  `data_ultimo_capitulo` date NOT NULL,
  `horario_exibicao` time DEFAULT NULL,
  `gravacao_novela` varchar(30) NOT NULL,
  `codigo_estilo` int(11) DEFAULT NULL,
  CONSTRAINT FK_TBNOVELA_ESTILO FOREIGN KEY (codigo_estilo) REFERENCES tbestilonovela(codigo_estilo),
);


INSERT INTO `tbnovela` (`codigo_novela`, `nome_novela`, `data_primeiro_capitulo`, `data_ultimo_capitulo`, `horario_exibicao`, `gravacao_novela`, `codigo_estilo`) VALUES
(100, 'oi', '2019-09-16', '2019-09-16', '15:00:00', 'xxx', NULL),
(101, 'Irma', '2018-01-10', '2020-04-03', '03:24:16', 'inédita', 1),
(102, 'Xaviera', '2018-06-09', '2019-09-08', '12:57:02', 'inédita', 1),
(103, 'Jordan', '2018-02-28', '2019-10-26', '09:09:16', 'inédita', 2),
(104, 'Mistérios de uma vida', '2019-02-25', '2020-08-14', '08:31:25', 'inédita', 1),
(105, 'John', '2018-10-05', '2020-02-09', '05:26:56', 'inédita', 4),
(106, 'Lucian', '2019-03-26', '2020-05-27', NULL, 'inédita', 1),
(107, 'Nolan', '2018-01-16', '2019-12-24', NULL, 'inédita', 5),
(108, 'Elliott', '2019-11-13', '2020-05-30', NULL, 'inédita', 2),
(109, 'Isaac', '2016-06-21', '2017-03-23', NULL, 'inédita', 1),
(110, 'Allen', '2018-08-15', '2020-03-15', '07:25:38', 'inédita', 2);



CREATE TABLE `tbcapitulos` (
  `codigo_capitulo` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome_capitulo` varchar(50) NOT NULL,
  `data_exibicao_capitulo` date NOT NULL,
  `codigo_novela` int(11) DEFAULT NULL,
  CONSTRAINT FK_TBCAPITULOS_NOVELA FOREIGN KEY (codigo_novela) REFERENCES tbnovela(codigo_novela),
);


INSERT INTO `tbcapitulos` (`codigo_capitulo`, `nome_capitulo`, `data_exibicao_capitulo`, `codigo_novela`) VALUES
(1, 'P.O. Box 367, 1871 Nibh St.', '2017-05-02', 8),
(2, 'Ap #321-3760 Vulputate, Av.', '2017-11-27', 6),
(3, '747-4811 Turpis St.', '2003-02-25', 3),
(4, '757-5469 Sed Avenue', '2002-06-12', 4),
(5, '864-4616 Nam St.', '2013-11-08', 7),
(6, '4074 Dictum Road', '2013-07-17', 5),
(7, 'Ap #666-6856 Mauris, Rd.', '2016-03-24', 5),
(8, '6775 Id, Av.', '2006-03-14', 4),
(9, 'Ap #219-2153 Vulputate, Road', '2012-02-26', 10),
(10, 'Ap #477-7378 Ornare Street', '2011-12-19', 1);


CREATE TABLE `tbestilonovela` (
  `codigo_estilo` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome_estilo` varchar(20) NOT NULL
);


INSERT INTO `tbestilonovela` (`codigo_estilo`, `nome_estilo`) VALUES
(100, 'Comédia'),
(101, 'Aventura'),
(102, 'Ação'),
(103, 'Romance'),
(104, 'Suspense');

CREATE TABLE `tbpersonagem` (
  `codigo_personagem` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome_personagem` varchar(50) NOT NULL,
  `idade_personagem` int(11) NOT NULL,
  `situacao_financeira_personagem` varchar(20) NOT NULL,
  `codigo_ator` int(11) DEFAULT NULL,
  CONSTRAINT FK_TBPERSONAGEM_ATOR FOREIGN KEY (codigo_ator) REFERENCES tbator(codigo_ator), 
);



INSERT INTO `tbpersonagem` (`codigo_personagem`, `nome_personagem`, `idade_personagem`, `situacao_financeira_personagem`, `codigo_ator`) VALUES
(1, 'Citalopram HBr', 3, 'Rico', 7),
(2, 'Simvastatin', 42, 'Rico', 5),
(3, 'Amlodipine Besylate', 34, 'Rico', 7),
(4, 'Levoxyl', 38, 'Rico', 8),
(5, 'Alendronate Sodium', 92, 'Rico', 10),
(6, 'Trazodone HCl', 91, 'Pobre', 9),
(7, 'Clindamycin HCl', 2, 'Pobre', 6),
(8, 'Plavix', 48, 'Pobre', 8),
(9, 'Lorazepam', 24, 'Pobre', 9),
(10, 'Suboxone', 27, 'Pobre', 8),
(11, 'Rivotril', 2, 'Rico', 1);

CREATE TABLE `tbnovelapersonagem` (
  `codigo_novela` int(11),
  `codigo_personagem` int(11),
  CONSTRAINT FK_TBNOVELA_PERSONAGEM FOREIGN KEY (codigo_personagem) REFERENCES tbpersonagem(codigo_personagem),
  CONSTRAINT FK_TBNOVELA_NOVELA FOREIGN KEY(codigo_novela) REFERENCES tbnovela(codigo_novela)
);

INSERT INTO `tbnovelapersonagem` (`codigo_novela`, `codigo_personagem`) VALUES
(108, 7),
(106, 1),
(108, 9),
(108, 1),
(110, 7),
(101, 1),
(107, 9),
(103, 1),
(103, 2),
(105, 1),
(100, 11),
(100, 11),
(100, 2),
(100, 7),
(100, 6),
(108, 11),
(102, 3),
(100, 8),
(100, 9),
(104, 7),
(104, 7);
