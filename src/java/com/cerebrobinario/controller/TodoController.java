/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cerebrobinario.controller;

import com.cerebrobinario.model.Todo;
import com.cerebrobinario.repository.TodoRepository;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Davidson
 */
@WebServlet(name = "TodoController", urlPatterns = {"/"})
public class TodoController extends HttpServlet {

    private TodoRepository repository = new TodoRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        String idString = req.getParameter("id");
        Integer id = null;
        String title = req.getParameter("title");

        if (action == null) {
            action = "read";
        }
        
        if(idString != null){
            id = Integer.parseInt(idString);
        }
        
        
        Todo todo = new Todo();
        
        todo.setId(id);
        todo.setTitle(title);
        todo.setDone(false);

        switch (action) {
            case "create":
                repository.create(todo);
                resp.sendRedirect("/CRUD_LUTADOR/");
                break;
            case "read":
                List<Todo> todos = repository.read();
                req.setAttribute("todos", todos);
                RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/index.jsp");
                rd.forward(req, resp);
                break;
            case "update":
                repository.update(todo);
                 resp.sendRedirect("/CRUD_LUTADOR/");
                break;
            case "delete":
                repository.delete(todo);
                resp.sendRedirect("/CRUD_LUTADOR/");
                break;
            default:
                break;
        }

    }

}
