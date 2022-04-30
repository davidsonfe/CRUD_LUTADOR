<%-- 
    Document   : index
    Created on : 27/04/2022, 00:22:37
    Author     : Davidson
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD_LUTADOR</title>

        <!-- Bootstrap -->

        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    <body class="container mt-5">
        <h1>CRUD DE LUTADOR</h1>

        <button class="btn btn-success mb-4" data-bs-toggle="modal" data-bs-target="#createModal">+ Nome do Lutador</button>
        <button class="btn btn-success mb-4" data-bs-toggle="modal" data-bs-target="#createModal">+ Apelido do Lutador</button>
        <button class="btn btn-success mb-4" data-bs-toggle="modal" data-bs-target="#createModal">+ Peso do Lutador</button>
        <button class="btn btn-success mb-4" data-bs-toggle="modal" data-bs-target="#createModal">+ Arte Marcial do Lutador</button>
        <button class="btn btn-success mb-4" data-bs-toggle="modal" data-bs-target="#createModal">+ Data/Nascimento do Lutador</button>
        <table class="table">
            <thead>
                <tr>
                    <th>LUTADOR</th>
                    <th></th>
                </tr> 
            </thead>

            <tbody>
                <c:forEach items="${todos}" var="t">
                    <tr>
                        <td><c:out value="${t.title}" /></td>
                        <td>

                            <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#updateModal"
                                    onclick="onUpdate(${t.id}, '${t.title}')">
                                Editar
                            </button>
                            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"
                                    onclick="onDelete(${t.id}, '${t.title}')">
                                Deletar
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <!-- Modal create -->
        <div class="modal fade" id="createModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Lutador</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/CRUD_LUTADOR/">
                            <div class="form-group">
                                <label for="title"></label>
                                <input class="form-control" id="title" name="title" placeholder="Nome/Apelido/peso/Arte Marcial/Nascim"/>
                            </div>
                            <input type="hidden" name="action" value="create" />
                            <button type="submit" class="btn btn-success mt-3">Adicionar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal update -->
        <div class="modal fade" id="updateModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Editar Lutador</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/CRUD_LUTADOR/">
                            <div class="form-group">
                                <label for="title">Lutador</label>
                                <input class="form-control" id="title" name="title"/>
                            </div>
                            <input type="hidden" name="id" value="" />
                            <input type="hidden" name="action" value="update" />
                            <button type="submit" class="btn btn-success mt-3">Atualizar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal delete -->
        <div class="modal fade" id="deleteModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Certeza que deseja remover Lutador?</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/CRUD_LUTADOR/">
                            <div class="form-group">
                                <label for="title">Nome/Peso/Artemarcial/</label>
                                <input class="form-control" id="title" name="title" readonly=""/>
                            </div>
                            <input type="hidden" name="id" />
                            <input type="hidden" name="action" value="delete" />
                            <button type="submit" class="btn btn-danger mt-3">Deletar</button>
                            <button type="submit" class="btn btn-secondary mt-3" data-bs-dismiss="modal">Cancelar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>   

        <script>
            function onUpdate(id, title) {
                var idEl = document.querySelector("#updateModal input[name=id]");
                var titleEl = document.querySelector("#updateModal input[name=title]");

                idEl.value = id;
                titleEl.value = title;
            }


            function onDelete(id, title) {
                var idEl = document.querySelector("#deleteModal input[name=id]");
                var titleEl = document.querySelector("#deleteModal input[name=title]");

                idEl.value = id;
                titleEl.value = title;
            }
        </script>  
    </body>
</html>
