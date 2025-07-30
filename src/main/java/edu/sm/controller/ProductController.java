package edu.sm.controller;

import edu.sm.dto.Category;
import edu.sm.dto.Cust;
import edu.sm.dto.Product;
import edu.sm.dto.Review;
import edu.sm.repository.CategoryRepository;
import edu.sm.service.ProductService;
import edu.sm.service.ReviewService;
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

    private final ProductService productService;
    private final CategoryRepository categoryRepository;
    private final ReviewService reviewService;

    // 상품 목록
    @GetMapping("")
    public String showAllProducts(Model model) throws Exception {
        List<Product> allProducts = productService.get();
        model.addAttribute("products", allProducts);
        List<Product> shuffled = allProducts.stream().collect(Collectors.toList());
        Collections.shuffle(shuffled);
        model.addAttribute("recommendedProducts", shuffled.stream().limit(8).collect(Collectors.toList()));
        return "product/main";
    }

    // 신상품
    @GetMapping("/new")
    public String showNewProducts(Model model) throws Exception {
        model.addAttribute("products", productService.getNewProducts());
        return "product/new";
    }

    // 베스트상품
    @GetMapping("/best")
    public String showBestProducts(Model model) throws Exception {
        model.addAttribute("products", productService.getBestBySales(8));
        return "product/best";
    }

    // 상품 등록 폼
    @GetMapping("/add")
    public String showAddForm(Model model) throws Exception {
        model.addAttribute("cates", categoryRepository.selectAll());
        model.addAttribute("product", new Product());
        return "product/add";
    }

    // 상품 등록 처리
    @PostMapping("/addimpl")
    public String registerProduct(@ModelAttribute Product product) throws Exception {
        productService.register(product);
        return "redirect:/product";
    }

    // 상품 수정 폼
    @GetMapping("/update")
    public String updatePage(@RequestParam("id") int id, Model model) throws Exception {
        model.addAttribute("product", productService.get(id));
        model.addAttribute("cates", categoryRepository.selectAll());
        return "product/update";
    }

    // 상품 수정 처리
    @PostMapping("/updateimpl")
    public String updateImpl(@ModelAttribute Product product) throws Exception {
        productService.modify(product);
        return "redirect:/product";
    }

    // 상품 삭제 폼
    @GetMapping("/delete")
    public String deletePage(@RequestParam("id") int id, Model model) throws Exception {
        model.addAttribute("product", productService.get(id));
        return "product/delete";
    }

    // 상품 삭제 처리
    @PostMapping("/deleteimpl")
    public String deleteImpl(@RequestParam("productId") int id) throws Exception {
        productService.remove(id);
        return "redirect:/product";
    }

    // 상품 상세보기 + 리뷰 리스트, 작성폼
    @GetMapping("/detail")
    public String detailPage(
            @RequestParam("id") int id,
            Model model,
            @SessionAttribute(name = "logincust", required = false) Cust loginCust
    ) throws Exception {
        Product product = productService.get(id);
        model.addAttribute("product", product);
        Category category = categoryRepository.selectAll().stream()
                .filter(c -> c.getCateId() == product.getCateId())
                .findFirst().orElse(null);
        model.addAttribute("category", category);
        List<Review> reviews = reviewService.getByProduct(id);
        model.addAttribute("reviews", reviews);
        if (loginCust != null) {
            Review newReview = new Review();
            newReview.setProductId(id);
            newReview.setCustId(loginCust.getCustId());
            model.addAttribute("newReview", newReview);
        }
        return "product/detail";
    }

    // 리뷰 등록
    @PostMapping("/detail/{id}/review")
    public String writeReview(
            @PathVariable("id") int id,
            @ModelAttribute("newReview") Review review
    ) throws Exception {
        reviewService.write(review);
        return "redirect:/product/detail?id=" + id;
    }

    // 리뷰 수정
    @PostMapping("/detail/{productId}/review/{reviewId}/edit")
    public String editReviewSubmit(
            @PathVariable int productId,
            @PathVariable int reviewId,
            @RequestParam String comment,
            @RequestParam int rating
    ) throws Exception {
        Review edit = new Review();
        edit.setReviewId(reviewId);
        edit.setComment(comment);
        edit.setRating(rating);
        reviewService.modify(edit);
        return "redirect:/product/detail?id=" + productId;
    }
    // 리뷰 삭제 처리
    @PostMapping("/detail/{productId}/review/{reviewId}/delete")
    public String deleteReview(
            @PathVariable int productId,
            @PathVariable int reviewId,
            @SessionAttribute(name = "logincust", required = false) Cust loginCust
    ) throws Exception {
        // 1) 로그인 확인
        if (loginCust == null) {
            throw new IllegalStateException("로그인한 사용자만 삭제할 수 있습니다.");
        }

        // 2) 작성자 본인 또는 관리자 확인
        Review target = reviewService.select(reviewId);
        String writerId = target.getCustId();
        String loginId  = loginCust.getCustId();
        boolean isOwner = loginId.equals(writerId);
        boolean isAdmin = loginId.equals("admin");
        if (! (isOwner || isAdmin) ) {
            throw new IllegalStateException("본인이 작성했거나 관리자만 삭제할 수 있습니다.");
        }

        // 3) 삭제
        reviewService.remove(reviewId);

        // 4) 상세 페이지로 리다이렉트
        return "redirect:/product/detail?id=" + productId;
    }




    // 랜덤 추천
    @GetMapping("/recommended")
    public String showRecommendedProducts(Model model) throws Exception {
        List<Product> allProducts = productService.get();
        Collections.shuffle(allProducts);
        model.addAttribute("recommendedProducts", allProducts.stream().limit(8).collect(Collectors.toList()));
        return "product/recommend";
    }
}
