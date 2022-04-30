/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cerebrobinario.repository;

import com.cerebrobinario.model.Todo;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Davidson
 */
public class TodoRepository {
    
    private static int AUTO_INCREMENT = 0;
    private List<Todo> TODOS_DB = new ArrayList<>();
    
    //CRUD - create, read, update, delte
    
    public void create(Todo todo){
        AUTO_INCREMENT++;
        todo.setId(AUTO_INCREMENT);
        TODOS_DB.add(todo);
    }
    
    public List<Todo> read() {
        return TODOS_DB;
    }
    
    public void update(Todo todo){
        for(Todo t : TODOS_DB) {
            if(t.getId().intValue() == todo.getId().intValue()){
                t.setTitle(todo.getTitle());
                break;
            }
        }
    }

    public void delete(Todo todo) {
         for(Todo t : TODOS_DB) {
            if(t.getId().intValue() == todo.getId().intValue()){
                TODOS_DB.remove(t);
                break;
            }
        }
    }
}
