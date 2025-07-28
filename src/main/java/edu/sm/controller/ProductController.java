package edu.sm.controller;

import edu.sm.dto.Product;
import edu.sm.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
public class ProductController {

    final ProductService productService;

    // 상품 목록
    @GetMapping("")
    public String showAllProducts(Model model) throws Exception {
        model.addAttribute("products", productService.get());
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

    @GetMapping("/manage")
    public String productsManage(Model model) {return "product/manage";}

    // 상품 등록 폼 (GET)
    @GetMapping("/add")
    public String showAddForm() {
        return "product/add";
    }

    // 상품 등록 처리 (POST)
    @PostMapping("/addimpl")
    public String registerProduct(@ModelAttribute Product product) throws Exception {
        productService.register(product);
        return "redirect:/product";
    }
}