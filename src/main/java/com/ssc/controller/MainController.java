package com.ssc.controller;

import com.ssc.model.Products;
import com.ssc.service.ProService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Snekey on 2015/5/4.
 */
@Controller
@RequestMapping("")
public class MainController {

    @Resource
    private ProService proService;

    @RequestMapping(value="/del",method = {RequestMethod.POST})
    public void del(@RequestParam Integer id,Model model) {
        proService.delete(id);
    }

    @RequestMapping(value="/getById")
    public String getById(@RequestParam Integer id,Model model) {
        Products products = proService.get(id);
        model.addAttribute("pro", products);
        return "forward:edit.do";
    }

    @RequestMapping(value="/view")
    public String view(@RequestParam Integer id,Model model) {
        Products products = proService.get(id);
        model.addAttribute("pro", products);
        return "forward:check.do";
    }

    @RequestMapping(value="/update",method = {RequestMethod.POST})
    public void edit(Products pro) {
        proService.update(pro);
    }

    @RequestMapping(value="/add",method = {RequestMethod.POST})
    public String add(Products pro) {
        proService.insert(pro);
        List<Products> list = new ArrayList<Products>();
        list = proService.get();
        return "index";
    }

    @RequestMapping(value="/index")
    public String index(String name,Model model){
        List<Products> list = new ArrayList<Products>();
        if(name==""){
            list = proService.get();
        }
        else {
            Products products = proService.get(name);
            if (products!=null){
                list.add(products);
            }
        }
        model.addAttribute("list", list);
        model.addAttribute("name", name);
        return "index";
    }
    @RequestMapping("/next")
    public String next(Products pro){

        return "add";
    }
    @RequestMapping("/edit")
    public String ed(Products pro){

        return "edit";
    }
    @RequestMapping("/check")
    public String check(Products pro){

        return "view";
    }


}