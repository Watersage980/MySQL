-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Ago-2022 às 14:58
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `carlos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE `agenda` (
  `idAgenda` int(11) NOT NULL,
  `diaEntrega` datetime NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `fkVenda` int(11) NOT NULL,
  `pago` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `numeroCasa` varchar(25) DEFAULT NULL,
  `fkEndereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nome`, `numeroCasa`, `fkEndereco`) VALUES
(1, 'R', '82', 1),
(2, 'Josiel', '23', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `idEndereco` int(11) NOT NULL,
  `logradouro` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`idEndereco`, `logradouro`, `bairro`, `cidade`, `complemento`) VALUES
(1, 'rua Antonio', 'Parque das flores', 'guara', NULL),
(2, 'Avenida adamante', 'Parque das flores', 'guara', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingredientes`
--

CREATE TABLE `ingredientes` (
  `idIngredientes` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `quantidade` decimal(6,0) DEFAULT NULL,
  `valorMercado` float NOT NULL,
  `qtdMinima` decimal(6,0) DEFAULT NULL,
  `dataCompra` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ingredientes`
--

INSERT INTO `ingredientes` (`idIngredientes`, `nome`, `quantidade`, `valorMercado`, `qtdMinima`, `dataCompra`) VALUES
(1, 'farinha', '5000', 13, '2000', '2022-08-08 10:56:51'),
(2, 'frango', '7000', 20, '500', '2022-08-07 12:30:00'),
(3, 'óleo', '2000', 10, '1000', '2022-08-08 11:50:57'),
(4, 'carne moída', '2000', 39, '1000', '2022-08-07 13:00:00'),
(5, 'trigo', '2500', 10, '1000', '2022-08-07 13:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itensingredientes`
--

CREATE TABLE `itensingredientes` (
  `idItensIngredientes` int(11) NOT NULL,
  `qtdUsada` decimal(4,0) NOT NULL,
  `fkIngredientes` int(11) NOT NULL,
  `fkProdutosProntos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `itensingredientes`
--

INSERT INTO `itensingredientes` (`idItensIngredientes`, `qtdUsada`, `fkIngredientes`, `fkProdutosProntos`) VALUES
(1, '1000', 1, 1),
(2, '450', 2, 1),
(3, '1500', 3, 1),
(4, '1500', 3, 2),
(5, '500', 4, 2),
(6, '500', 5, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itensvendidos`
--

CREATE TABLE `itensvendidos` (
  `idItensVendidos` int(11) NOT NULL,
  `quantidade` decimal(4,0) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `valorVenda` float NOT NULL,
  `fkVenda` int(11) NOT NULL,
  `fkProdutosProntos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `itensvendidos`
--

INSERT INTO `itensvendidos` (`idItensVendidos`, `quantidade`, `descricao`, `valorVenda`, `fkVenda`, `fkProdutosProntos`) VALUES
(1, '200', NULL, 60, 1, 1),
(2, '200', NULL, 60, 1, 2),
(3, '100', NULL, 30, 2, 1),
(4, '100', NULL, 30, 2, 1),
(5, '100', NULL, 30, 3, 1),
(6, '100', NULL, 30, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtosprontos`
--

CREATE TABLE `produtosprontos` (
  `idProdutosProntos` int(11) NOT NULL,
  `quantidade` decimal(4,0) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `qtdMinima` decimal(4,0) NOT NULL,
  `valorVenda` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtosprontos`
--

INSERT INTO `produtosprontos` (`idProdutosProntos`, `quantidade`, `nome`, `qtdMinima`, `valorVenda`) VALUES
(1, '500', 'coxinha', '200', 30),
(2, '500', 'kibes', '200', 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `idTelefone` int(11) NOT NULL,
  `ddd` decimal(2,0) NOT NULL,
  `numeroTelefone` decimal(9,0) NOT NULL,
  `fkCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `telefone`
--

INSERT INTO `telefone` (`idTelefone`, `ddd`, `numeroTelefone`, `fkCliente`) VALUES
(1, '12', '995959596', 1),
(2, '12', '656145325', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `idVenda` int(11) NOT NULL,
  `valorTotal` float NOT NULL,
  `diaVenda` datetime NOT NULL,
  `fkCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`idVenda`, `valorTotal`, `diaVenda`, `fkCliente`) VALUES
(1, 120, '2022-08-04 09:30:25', 1),
(2, 60, '2022-08-09 11:10:29', 1),
(3, 60, '2022-08-09 11:17:07', 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`idAgenda`),
  ADD KEY `fkVenda` (`fkVenda`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fkEndereco` (`fkEndereco`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`idEndereco`);

--
-- Índices para tabela `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`idIngredientes`);

--
-- Índices para tabela `itensingredientes`
--
ALTER TABLE `itensingredientes`
  ADD PRIMARY KEY (`idItensIngredientes`),
  ADD KEY `fkIngredientes` (`fkIngredientes`),
  ADD KEY `fkProdutosProntos` (`fkProdutosProntos`);

--
-- Índices para tabela `itensvendidos`
--
ALTER TABLE `itensvendidos`
  ADD PRIMARY KEY (`idItensVendidos`),
  ADD KEY `fkProdutosProntos` (`fkProdutosProntos`),
  ADD KEY `fkVenda` (`fkVenda`);

--
-- Índices para tabela `produtosprontos`
--
ALTER TABLE `produtosprontos`
  ADD PRIMARY KEY (`idProdutosProntos`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`idTelefone`),
  ADD KEY `fkCliente` (`fkCliente`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idVenda`),
  ADD KEY `fkCliente` (`fkCliente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda`
--
ALTER TABLE `agenda`
  MODIFY `idAgenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idEndereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `idIngredientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `itensingredientes`
--
ALTER TABLE `itensingredientes`
  MODIFY `idItensIngredientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `itensvendidos`
--
ALTER TABLE `itensvendidos`
  MODIFY `idItensVendidos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `produtosprontos`
--
ALTER TABLE `produtosprontos`
  MODIFY `idProdutosProntos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `telefone`
--
ALTER TABLE `telefone`
  MODIFY `idTelefone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `idVenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`fkVenda`) REFERENCES `venda` (`idVenda`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`fkEndereco`) REFERENCES `endereco` (`idEndereco`);

--
-- Limitadores para a tabela `itensingredientes`
--
ALTER TABLE `itensingredientes`
  ADD CONSTRAINT `itensingredientes_ibfk_1` FOREIGN KEY (`fkIngredientes`) REFERENCES `ingredientes` (`idIngredientes`),
  ADD CONSTRAINT `itensingredientes_ibfk_2` FOREIGN KEY (`fkProdutosProntos`) REFERENCES `produtosprontos` (`idProdutosProntos`);

--
-- Limitadores para a tabela `itensvendidos`
--
ALTER TABLE `itensvendidos`
  ADD CONSTRAINT `itensvendidos_ibfk_1` FOREIGN KEY (`fkProdutosProntos`) REFERENCES `produtosprontos` (`idProdutosProntos`),
  ADD CONSTRAINT `itensvendidos_ibfk_2` FOREIGN KEY (`fkVenda`) REFERENCES `venda` (`idVenda`);

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`fkCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`fkCliente`) REFERENCES `cliente` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
