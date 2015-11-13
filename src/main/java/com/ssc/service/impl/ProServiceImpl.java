package com.ssc.service.impl;

import com.ssc.dao.ProDao;
import com.ssc.model.Products;
import com.ssc.service.ProService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Snekey on 2015/5/4.
 */
@Service
public class ProServiceImpl implements ProService {
    @Resource
    private ProDao proDao;
    @Override
    public void insert(Products pro) {
        // TODO Auto-generated method stub
         this.proDao.insertPro(pro);
    }
    @Override
    public void update(Products pro){
        this.proDao.updatePro(pro);
    }
    @Override
    public Products get(String name){
        return this.proDao.getByName(name);
    }
    @Override
    public void delete(int id){
        this.proDao.deletePro(id);
    }
    @Override
    public List<Products> get(){
        return this.proDao.getAll();
    }
    @Override
    public Products get(int id){
        return this.proDao.getById(id);
    }
}
