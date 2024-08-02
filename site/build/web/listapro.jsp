<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Produtos</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <%
            try {
                // Fazer a Conexão com o Banco de Dados MySQL
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudprodutos", "root", "2105");

                // Listar Produtos
                st = conecta.prepareStatement("SELECT * FROM produto");
                ResultSet rs = st.executeQuery();
                %>
                
                <table border="1">
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Marca</th>
                        <th>Preço</th>
                        <th>Excluir Produto</th>
                        <th>Alterar Produto</th>
                    </tr>
            
                <%
                while(rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("codigo") %></td>
                    <td><%= rs.getString("nome") %></td>
                    <td><%= rs.getString("marca") %></td>
                    <td><%= rs.getString("preco") %></td>
                    <td><a href="excpro.jsp?codigo=<%= rs.getString("codigo") %>">Excluir</a></td>
                    <td><a href="carregapro.jsp?codigo=<%= rs.getString("codigo") %>">Alterar </a></td>
                </tr>
                <%
            }
            %>
                </table>
            <%
            } catch (Exception x) {
                out.print("Erro:" + x.getMessage());
            }
        %>
    </body>
</html>
