SELECT Pe.*, PF.CPF 
FROM Pessoa Pe
JOIN PessoaFisica PF ON Pe.idPessoa = PF.FK_Pessoa_id;

SELECT Pe.*, PJ.CNPJ 
FROM Pessoa Pe
JOIN PessoaJuridica PJ ON Pe.idPessoa = PJ.FK_Pessoa_id;

SELECT Mov.idMovimento, Tipo, pe.Nome AS Fornecedor, pr.Nome AS Produto, Mov.Quantidade, Mov.PrecoUnitario, (Mov.Quantidade * Mov.PrecoUnitario) AS Total
FROM Movimento Mov
INNER JOIN Pessoa pe ON pe.idPessoa = Mov.FK_Pessoa_id
INNER JOIN Produto pr ON pr.idProduto = Mov.FK_Produto_id
WHERE Mov.Tipo = 'E';

SELECT Mov.idMovimento, Tipo, pe.Nome AS Fornecedor, pr.Nome AS Produto, Mov.Quantidade, Mov.PrecoUnitario, (Mov.Quantidade * Mov.PrecoUnitario) AS Total
FROM Movimento Mov
INNER JOIN Pessoa pe ON pe.idPessoa = Mov.FK_Pessoa_id
INNER JOIN Produto pr ON pr.idProduto = Mov.FK_Produto_id
WHERE Mov.Tipo = 'S';

SELECT pr.Nome, SUM(Mov.Quantidade * Mov.PrecoUnitario) AS Compras
FROM Movimento Mov
INNER JOIN Produto pr ON Mov.FK_Produto_id = pr.idProduto
WHERE Mov.Tipo = 'E'
GROUP BY pr.Nome;

SELECT pr.Nome, SUM(Mov.Quantidade * Mov.PrecoUnitario) AS Vendas
FROM Movimento Mov
INNER JOIN Produto pr ON Mov.FK_Produto_id = pr.idProduto
WHERE Mov.Tipo = 'S'
GROUP BY pr.Nome;

SELECT Us.*
FROM Usuario Us
LEFT JOIN Movimento mov ON Us.idUsuario = mov.FK_Usuario_id AND mov.Tipo = 'E'
WHERE mov.Movimento IS NULL;

SELECT us.Login, SUM(Mov.PrecoUnitario * Mov.Quantidade) AS Compras
FROM Movimento Mov
INNER JOIN Usuario us ON Mov.FK_Usuario_id = us.idUsuario
WHERE Mov.Tipo = 'E'
GROUP BY us.Login;

SELECT us.Login, SUM(Mov.PrecoUnitario * Mov.Quantidade) AS Vendas
FROM Movimento Mov
INNER JOIN Usuario us ON Mov.FK_Usuario_id = us.idUsuario
WHERE Mov.Tipo = 'S'
GROUP BY us.Login;

SELECT pr.Nome, SUM(Mov.PrecoUnitario * Mov.Quantidade) / SUM(Mov.Quantidade AS Media)
FROM Movimento Mov
INNER JOIN Produto pr ON Mov.FK_Produto_id = pr.idProduto
WHERE Mov.Tipo = 'S'
GROUP BY pr.Nome;