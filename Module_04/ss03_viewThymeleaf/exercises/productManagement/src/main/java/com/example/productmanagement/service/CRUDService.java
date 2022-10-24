package com.example.productmanagement.service;
import com.example.productmanagement.model.Product;

import java.util.List;
public interface CRUDService<T> {
    List<T> findAll();
    void create(T t) throws Exception;
    void update(T t) throws Exception;
    void delete(String id) throws Exception;
    Product findById(String id) throws Exception;
    List<T> findByName(String name) throws Exception;
}