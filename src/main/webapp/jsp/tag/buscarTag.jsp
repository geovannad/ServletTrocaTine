<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.servlettrocatine.model.Tag" %>
<html>
<head>
    <title>Buscar Admin por ID</title>
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
        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #55aca0;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #ffa201;
        }
        table {
            width: 60%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #55aca0;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ffa201;
            cursor: pointer;
        }
        .error-message {
            color: red;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<h1>Buscar Tag por ID</h1>

<!-- Formulário de busca -->
<form action="${pageContext.request.contextPath}/buscarTagPorId" method="GET">
    <input type="text" name="id" placeholder="Digite o ID do tag" required>
    <input type="submit" value="BuscarTag">
</form>

<%
    // Recupera o administrador buscado do atributo da requisição
    Tag tag = (Tag) request.getAttribute("tag");
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (tag != null) {
%>
<table>
    <tr>
        <th>ID</th>
        <th>Cor</th>
        <th>Genero</th>
        <th>Qualidade</th>
        <th>Tamanho</th>
        <th>ID Categoria</th>
    </tr>
    <tr>
        <td><%= tag.getId() %></td>
        <td><%= tag.getCor() %></td>
        <td><%= tag.getGenero() %></td>
        <td><%= tag.getQualidade() %></td>
        <td><%= tag.getTamanho() %></td>
        <td><%= tag.getIdTipo_produto() %></td>
    </tr>
</table>
<%
} else if (errorMessage != null) {
%>
<p class="error-message"><%= errorMessage %></p>
<%
    }
%>
</body>
</html>
