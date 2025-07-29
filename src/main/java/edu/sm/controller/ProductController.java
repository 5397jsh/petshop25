package edu.sm.controller;

import edu.sm.dto.Category;
import edu.sm.dto.Product;
import edu.sm.repository.CategoryRepository;
import edu.sm.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
public class ProductController {

    final ProductService productService;
    final CategoryRepository categoryRepository;

    // 상품 목록
    @GetMapping("")
    public String showAllProducts(Model model) throws Exception {
        List<Product> allProducts = productService.get();
        model.addAttribute("products", allProducts);  // ❗ 얘는 원본 그대로 전달

        // ✅ 복사본 만들어서 섞는다
        List<Product> shuffled = allProducts.stream().collect(Collectors.toList());
        Collections.shuffle(shuffled);
        List<Product> recommended = shuffled.stream()
                .limit(10)
                .collect(Collectors.toList());

        model.addAttribute("recommendedProducts", recommended);

        return "product/main";
    }


    // 신상품
    @GetMapping("/new")
    public String showNewProducts(Model model) throws Exception {
        List<Product> newProducts = productService.getNewProducts();
        model.addAttribute("products", newProducts);
        return "product/new";
    }


    @GetMapping("/best")
    public String showBestProducts(Model model) {
        return "product/best";
    }

    // 상품 등록 폼 (GET)
    @GetMapping("/add")
    public String showAddForm(Model model) throws Exception {
        List<Category> cates = categoryRepository.selectAll();
        model.addAttribute("cates", cates);
        model.addAttribute("product", new Product()); // 등록용 빈 객체

        return "product/add";
    }


    // 상품 등록 처리 (POST)
    @PostMapping("/addimpl")
    public String registerProduct(@ModelAttribute Product product) throws Exception {
        productService.register(product);
        return "redirect:/product";
    }
    @GetMapping("/update")
    public String updatePage(@RequestParam("id") int id, Model model) throws Exception {
        model.addAttribute("product", productService.get(id));
        return "product/update"; // update.jsp
    }

    @PostMapping("/updateimpl")
    public String updateImpl(@ModelAttribute Product product) throws Exception {
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
    // 랜덤 물품 추천
    @GetMapping("/recommended")
    public String showRecommendedProducts(Model model) throws Exception {
        List<Product> allProducts = productService.get(); // 전체 상품
        Collections.shuffle(allProducts); // 랜덤 섞기
        int numberOfRecommendations = 10;
        List<Product> recommended = allProducts.stream()
                .limit(numberOfRecommendations)
                .collect(Collectors.toList());

        model.addAttribute("recommendedProducts", recommended);
        return "product/recommend"; // 예시 JSP 경로
    }

}