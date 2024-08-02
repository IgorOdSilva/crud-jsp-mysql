<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Produtos</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <%
         
        // Receber os Dados do Formulário cadpro.html        
            int codigo;
            String nome;
            String marca;
            double preco;
            
            codigo = Integer.parseInt(request.getParameter("codigo"));
            
            nome = request.getParameter("nome");
            
            marca = request.getParameter("marca");
            
            preco = Double.parseDouble(request.getParameter("preco"));
            
        // Fazer a Conexão com o Banco de Dados MySQL
            Connection conecta;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudprodutos", "root", "2105");


        PreparedStatement st;
        st = conecta.prepareStatement("UPDATE produto SET nome=?, marca=?, preco=? WHERE codigo=? ");
        st.setString(1, nome);
        st.setString(2, marca);
        st.setDouble(3, preco);
        st.setInt(4, codigo);
        st.executeUpdate();
        
        out.print("O produto " + codigo + "foi alterado com sucesso!");

        %>
    </body>
</html>
