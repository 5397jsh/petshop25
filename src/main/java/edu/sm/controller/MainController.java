package edu.sm.controller;

import edu.sm.dto.Product;
import edu.sm.service.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Collections;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {

    final ProductService productService;

    @GetMapping("/")
    public String index(Model model) throws Exception {
        // 전체 상품 목록 가져오기
        List<Product> allProducts = productService.get();

        // 랜덤으로 섞은 후 10개만 추출
        Collections.shuffle(allProducts);
        List<Product> recommended = allProducts.stream()
                .limit(8)
                .toList();

        // 모델에 recommendedProducts로 전달
        model.addAttribute("recommendedProducts", recommended);

        // index.jsp 렌더링
        return "index";
    }
}
