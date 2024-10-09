USE Loja;

INSERT INTO [Pessoa] (idPessoa, Nome, Endereco, Cidade, Estado, Email, Telefone)
VALUES
	(NEXT VALUE FOR listaPESSOA, 'Joao Fernandes Correia', 'Rua Jose Aristides', 'Divinopolis', 'Minas Gerais', 'JoaoFernandesCorreia@rhyta.com', '37 4647-9323'),
	(NEXT VALUE FOR listaPESSOA, 'Kaua Azevedo Silva', 'Rua Faustino Siqueira Franco', 'Guarulhos', 'Sao Paulo', 'KauaAzevedoSilva@armyspy.com', '11 4681-5575'),
	(NEXT VALUE FOR listaPESSOA, 'Heilig-Meyers', 'Estrada do Recanto 161', 'Timoteo', 'Minas Gerais', 'Heilig-Meyers@teleworm.us', '31 5667-6663'),
	(NEXT VALUE FOR listaPESSOA, 'Grupo Técnico Jardins', 'Praça Presidente Gamal Abdel Nasser 1403', 'Sao Paulo', 'Sao Paulo', 'Henceall@dayrep.com', '11 8783-6448');
	
INSERT INTO [PessoaFisica] (FK_Pessoa_id, CPF)
VALUES
	(1, '365.410.330-80'),
	(2, '78349632011');
	
INSERT INTO [PessoaJuridica] (FK_Pessoa_id, CNPJ)
VALUES
	(3, '95.823.031/0001-59'),
	(4, '67652009000158');
	
INSERT INTO [Usuario] (idUsuario, Login, Senha)
VALUES
	(1, 'CorreiaJF', 'hDq$@j8'),
	(2, 'KakuaA', 'Gjyakyjav'),
	(3, 'HM.Estoque', 'hgd6au28'),
	(4, 'LojaGTJ', 'senha123');
	
INSERT INTO [Produto] (idProduto, Nome, Quantidade, PrecoVenda)
VALUES
	(1, 'Placa Mae', 250, 790.00),
	(2, 'Processador', 150, 850.00),
	(3, 'Placa de Video', 100, 1150.00),
	(4, 'Fonte de Alimentacao', 300, 650.00),
	(5, 'Memoria RAM', 350, 350.00),
	(6, 'Monitor', 200, 590.00),
	(7, 'Teclado', 500, 150.00),
	(8, 'Mouse', 500, 90.00);
	
INSERT INTO [Movimento] (idMovimento, FK_Usuario_id, FK_Pessoa_id, FK_Produto_id, Tipo, Quantidade, PrecoUnitario)
VALUES
	(1, 1, 1, 4, 'E', 2, 650.00),
	(2, 1, 1, 4, 'S', 1, 700.00),
	(3, 2, 2, 5, 'S', 2, 450.00),
	(4, 3, 3, 1, 'E', 50, 790.00),
	(5, 3, 3, 2, 'E', 50, 850.00),
	(6, 3, 3, 1, 'S', 3, 840.00),
	(7, 3, 3, 3, 'S', 2, 1300.00),
	(8, 4, 4, 6, 'E', 25, 590.00),
	(9, 4, 4, 7, 'S', 7, 169.90),
	(10, 4, 4, 8, 'S', 9, 109.90);