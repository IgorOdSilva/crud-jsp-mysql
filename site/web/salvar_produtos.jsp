<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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

            // Receber os Dados do Formulário cadpro.html        
            int codigo;
            String nome;
            String marca;
            double preco;
            
            codigo = Integer.parseInt(request.getParameter("codigo"));
            
            nome = request.getParameter("nome");
            
            marca = request.getParameter("marca");
            
            preco = Double.parseDouble(request.getParameter("preco"));
            
            try {
                // Fazer a Conexão com o Banco de Dados MySQL
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudprodutos", "root", "2105");

                // Inserir os Dados na Tabela
                st = conecta.prepareStatement("INSERT INTO produto values(?, ?, ?, ?)");
                st.setInt(1, codigo);
                st.setString(2, nome);
                st.setString(3, marca);
                st.setDouble(4, preco);
                st.executeUpdate(); // Exexuta o Comando INSERT
                out.print("Produto Cadastrado com Sucesso!");
            } catch (Exception x) {
                String erro = x.getMessage();
                if (erro.contains("Duplicate entry")) {
                    out.print("Este produto já está cadastrado");
                } else {
                    out.print("Erro:" + x.getMessage());
                }
            }
            
        %>
    </body>
</html>
