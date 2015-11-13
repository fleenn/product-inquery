package com.ssc.service;

import com.ssc.model.Products;

import java.util.List;

/**
 * Created by Snekey on 2015/5/4.
 */
public interface ProService {
    public void insert(Products pro);
    public void update(Products pro);
    public Products get(String name);
    public void delete(int id);
    public List<Products> get();
    public Products get(int id);
}
