package com.ssc.dao;

import com.ssc.model.Products;

import java.util.List;

/**
 * Created by Snekey on 2015/5/4.
 */
    public interface ProDao {
     void insertPro(Products pro);
     void updatePro(Products pro);
     Products getByName(String name);
     void deletePro(int id);
     List<Products> getAll();
     Products getById(int id);
}
