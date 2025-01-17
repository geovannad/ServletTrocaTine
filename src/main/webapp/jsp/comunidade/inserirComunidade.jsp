<%--
  Created by IntelliJ IDEA.
  User: lucastaxiotti-ieg
  Date: 25/10/2024
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inserir Comunidade</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
      text-align: center;
      padding: 50px;
    }
    h1 {
      color: #333;
      margin-bottom: 30px;
    }
    form {
      margin-bottom: 30px;
    }
    input[type="text"], input[type="number"] {
      padding: 10px;
      font-size: 16px;
      width: 300px;
      border: 1px solid #ccc;
      border-radius: 5px;
      margin-bottom: 10px;
    }
    input[type="submit"], .btn-back {
      padding: 10px 20px;
      font-size: 16px;
      background-color: #55aca0;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      text-decoration: none;
    }
    input[type="submit"]:hover, .btn-back:hover {
      background-color: #ffa201;
    }
    .btn-back {
      display: inline-block;
      margin-top: 20px;
    }
  </style>
</head>
<body>
<h1>Inserir Comunidade</h1>
  <form action="${pageContext.request.contextPath}/inserirComunidade" method="post" enctype="multipart/form-data">
    <label for="nome">Nome:</label>
    <input type="text" name="nome" id="nome">
    <label for="criador">Criador:</label>
    <input type="text" name="criador" id="criador">
    <label for="descricao">Descrição:</label>
    <input type="text" name="descricao" id="descricao">
    <label for="qntIntegrantes">Quantidade de integrantes:</label>
    <input type="number" name="qntIntegrantes" id="qntIntegrantes">
    <label for="foto">Foto do Perfil:</label>
    <input type="text" name="foto" id="foto">
    <input type="submit" value="Inserir">
  </form>
<a href="${pageContext.request.contextPath}/comunidade" class="btn-back">Voltar para a Lista de Comunidades</a>

</body>
</html>
