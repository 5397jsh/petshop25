package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NewController {

    @GetMapping("/new")
    public String showNewProducts(Model model) {
        // 여기에 신상품 목록 불러오는 로직 작성
        // 예: List<Product> newProducts = productService.getNewProducts();
        // model.addAttribute("newProducts", newProducts);

        return "new";  // /WEB-INF/views/new.jsp 로 forward됨
    }
}