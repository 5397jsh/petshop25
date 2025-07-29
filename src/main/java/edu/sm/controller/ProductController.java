package edu.sm.controller;

import edu.sm.dto.Product;
import edu.sm.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
    @GetMapping("/edit")
    public String editPage(@RequestParam("id") int id, Model model) throws Exception {
        model.addAttribute("product", productService.get(id));
        return "product/edit"; // edit.jsp
    }

    @PostMapping("/editimpl")
    public String editImpl(@ModelAttribute Product product) throws Exception {
        productService.modify(product);
        return "redirect:/product";
    }

    @GetMapping("/delete")
    public String deletePage(@RequestParam("id") int id, Model model) throws Exception {
        model.addAttribute("product", productService.get(id));
        return "product/delete"; // delete.jsp
    }

    @PostMapping("/deleteimpl")
    public String deleteImpl(@RequestParam("productId") int id) throws Exception {
        productService.remove(id);
        return "redirect:/product";
    }
    // 상품 상세보기 (고객용)
    @GetMapping("/detail")
    public String detailPage(@RequestParam("id") int id, Model model) throws Exception {
        Product product = productService.get(id);
        model.addAttribute("product", product);
        return "product/detail"; // detail.jsp
    }


}