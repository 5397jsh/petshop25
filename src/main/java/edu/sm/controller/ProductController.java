package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {

    @GetMapping("")
    public String showAllProducts(Model model) {
        return "product/main";
    }

    @GetMapping("/new")
    public String showNewProducts(Model model) {
        return "product/new";
    }

    @GetMapping("/best")
    public String showBestProducts(Model model) {
        return "product/best";
    }
}
