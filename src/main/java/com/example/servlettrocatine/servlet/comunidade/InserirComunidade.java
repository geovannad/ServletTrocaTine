package com.example.servlettrocatine.servlet.comunidade;

import com.example.servlettrocatine.DAO.ComunidadeDAO;
import com.example.servlettrocatine.DAO.LogDAO;
import com.example.servlettrocatine.model.Comunidade;
import com.example.servlettrocatine.model.Log;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "inserirComunidade", value = "/inserirComunidade")
@MultipartConfig(maxFileSize = 16177215)
public class InserirComunidade extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ComunidadeDAO comunidadeDAO = new ComunidadeDAO();

        String nome = request.getParameter("nome");
        String criador = request.getParameter("criador");
        String descricao = request.getParameter("descricao");
        int qntIntegrantes = Integer.parseInt(request.getParameter("qntIntegrantes"));
        String foto = request.getParameter("foto");

        int idAdm = (Integer) request.getSession().getAttribute("idAdm");

        if (nome == null || criador == null || descricao == null || qntIntegrantes == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Todos os campos devem ser preenchidos!");
            return;
        }

        Comunidade comunidade = new Comunidade(nome, criador, descricao, qntIntegrantes, foto);
        boolean certo = comunidadeDAO.inserirComunidade(comunidade);

        Log log = new Log("Inserir", "Comunidade", "insert into comunidade (nome, criador, descricao, " +
                "qnt_integrantes, foto) values ('" + nome + "', '" + criador + "', '" +
                descricao + "', " + qntIntegrantes + ", '" + foto + "')", idAdm);
        LogDAO logDAO = new LogDAO();
        boolean logCerto = logDAO.inserirLog(log);

        if (certo && logCerto) {
            request.getSession().setAttribute("successMessage", "Comunidade adicionada com sucesso!");
            response.sendRedirect("jsp/adm/adicionarAdm.jsp");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao inserir comunidade.");
        }



    }
}
