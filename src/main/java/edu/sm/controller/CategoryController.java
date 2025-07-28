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
@RequestMapping
public class CategoryController {

    final ProductService productService;

    // 🐱 Cat
    @GetMapping("/cat/food")
    public String catFood(Model model) throws Exception {
        model.addAttribute("products", productService.getByCateId(10));
        return "cat/food";
    }

    @GetMapping("/cat/snack")
    public String catSnack(Model model) throws Exception {
        model.addAttribute("products", productService.getByCateId(11));
        return "cat/snack";
    }

    @GetMapping("/cat/sand")
    public String catSand(Model model) throws Exception {
        model.addAttribute("products", productService.getByCateId(12));
        return "cat/sand";
    }

    @GetMapping("/cat/bathroom")
    public String catBathroom(Model model) throws Exception {
        model.addAttribute("products", productService.getByCateId(13));
        return "cat/bathroom";
    }

    @GetMapping("/cat/toy")
    public String catToy(Model model) throws Exception {
        model.addAttribute("products", productService.getByCateId(14));
        return "cat/toy";
    }

    @GetMapping("/cat/house")
    public String catHouse(Model model) throws Exception {
        model.addAttribute("products", productService.getByCateId(15));
        return "cat/house";
    }

    // 🐶 Dog
    @GetMapping("/dog/food")
    public String dogFood(Model model) throws Exception {
        model.addAttribute("products", productService.getByCateId(20));
        return "dog/food";
    }

    @GetMapping("/dog/snack")
    public String dogSnack(Model model) throws Exception {
        model.addAttribute("products", productService.getByCateId(21));
        return "dog/snack";
    }

    @GetMapping("/dog/bathitem")
    public String dogBathitem(Model model) throws Exception {
        model.addAttribute("products", productService.getByCateId(22));
        return "dog/bathitem";
    }

    @GetMapping("/dog/rope")
    public String dogRope(Model model) throws Exception {
        model.addAttribute("products", productService.getByCateId(23));
        return "dog/rope";
    }

    @GetMapping("/dog/toy")
    public String dogToy(Model model) throws Exception {
        model.addAttribute("products", productService.getByCateId(24));
        return "dog/toy";
    }

    @GetMapping("/dog/house")
    public String dogHouse(Model model) throws Exception {
        model.addAttribute("products", productService.getByCateId(25));
        return "dog/house";
    }
}
