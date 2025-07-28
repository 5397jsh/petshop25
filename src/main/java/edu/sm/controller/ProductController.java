package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {

    @GetMapping("/product")
    public String showAllProducts(Model model) {
        // 여기에 신상품 목록 불러오는 로직 작성
        // 예: List<Product> newProducts = productService.getNewProducts();
        // model.addAttribute("newProducts", newProducts);

        return "product/main";  // /WEB-INF/views/product/main.jsp 로 forward됨
    }

    @GetMapping("/new")
    public String showNewProducts(Model model) {
        // 여기에 신상품 목록 불러오는 로직 작성
        // 예: List<Product> newProducts = productService.getNewProducts();
        // model.addAttribute("newProducts", newProducts);

        return "product/new";  // /WEB-INF/views/new.jsp 로 forward됨
    }

    @GetMapping("/best")
    public String showBestProducts(Model model) {
        // 여기에 신상품 목록 불러오는 로직 작성
        // 예: List<Product> newProducts = productService.getNewProducts();
        // model.addAttribute("newProducts", newProducts);

        return "product/best";  // /WEB-INF/views/new.jsp 로 forward됨
    }
}