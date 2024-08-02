<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <%

            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
            
            // Fazer a Conexão com o Banco de Dados MySQL
            Connection conecta;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudprodutos", "root", "2105");
            
            // Exclui o produto se o código for informado
            PreparedStatement st = conecta.prepareStatement("DELETE FROM produto WHERE codigo=?");
            st.setInt(1, cod);
            int resultado = st.executeUpdate();

            if (resultado == 0){
                out.print("Este produto não está cadastrado.");
            } else {
                out.print("Produto com o código " + cod + " excluido com sucesso!");
            }
        %>
    </body>
</html>
