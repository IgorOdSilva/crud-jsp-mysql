<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Produtos</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <%

            int codigo;
            
            codigo = Integer.parseInt(request.getParameter("codigo"));

            // Fazer a Conexão com o Banco de Dados MySQL
            Connection conecta;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudprodutos", "root", "2105");

            PreparedStatement st = conecta.prepareStatement("SELECT * FROM produto WHERE codigo = ?");
            st.setInt(1, codigo);
            ResultSet resultado = st.executeQuery();

            if (!resultado.next()) {
                out.print("Produto não foi encontrado!");
            } else {
        %>

            <form method="post" action="alterar_produtos.jsp">
                <p>
                    <label for="codigo">Código do Produto:</label>
                    <input type="number" name="codigo" id="codigo" value="<%= resultado.getString("codigo") %>" readonly>
                </p>
                <p>
                    <label for="nome">Nome do Produto:</label>
                    <input type="text" name="nome" id="nome" value="<%= resultado.getString("nome") %>">
                </p>
                <p>
                    <label for="marca">Marca do Produto:</label>
                    <input type="text" name="marca" id="marca" value="<%= resultado.getString("marca") %>">
                </p>
                <p>
                    <label for="preco">Preço do Produto:</label>
                    <input type="number" step="0.1" name="preco" id="preco" value="<%= resultado.getString("preco") %>">
                </p>
                <input type="submit" value="Salvar Alterações" class="botao">
            </form>

        <%
            }

        %>
    </body>
</html>
