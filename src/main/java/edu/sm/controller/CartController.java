package edu.sm.controller;

import edu.sm.dto.Cart;
import edu.sm.dto.Cust;
import edu.sm.service.CartService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    final CartService cartService;
    String dir = "/cart";

    @RequestMapping("")
    public String cart(HttpSession session, Model model) throws Exception {
        // 로그인한 고객 객체 가져오기
        Cust cust = (Cust) session.getAttribute("logincust");

        // 로그인 안 했으면 로그인 페이지로 리다이렉트
        if (cust == null) {
            return "redirect:/login";
        }

        // 고객 ID 추출
        String id = cust.getCustId();

        // 장바구니 조회
        List<Cart> list = cartService.findByCustId(id);
        model.addAttribute("carts", list);
        model.addAttribute("center", "cart/cart"); // 예: WEB-INF/views/cart/cart.jsp

        return "cart/cart"; // 템플릿 메인
    }

    @RequestMapping("/add")
    public String addToCart(
            @RequestParam("productId") int productId,
            @RequestParam("productName") String productName,
            @RequestParam("productPrice") int productPrice,
            @RequestParam("productImg") String productImg,
            @RequestParam("quantity") int quantity,
            HttpSession session
    ) throws Exception {
        Cust cust = (Cust) session.getAttribute("logincust");

        if (cust == null) {
            return "redirect:/login";  // 로그인 안 했으면 로그인 페이지로
        }

        Cart cart = new Cart();
        cart.setCustId(cust.getCustId());
        cart.setProductId(productId);
        cart.setProductName(productName);
        cart.setProductPrice(productPrice);
        cart.setProductImg(productImg);
        cart.setProductQt(quantity);

        cartService.register(cart); // DB에 추가

        return "redirect:/cart"; // 장바구니 목록 페이지로 이동
    }
    @PostMapping("/update")
    public String updateCart(@ModelAttribute Cart cart) throws Exception {
        cartService.modify(cart);
        return "redirect:/cart?id=" + cart.getCustId();  // 로그인 유지 필요
    }

    @PostMapping("/delete")
    public String deleteCart(@RequestParam("cartId") int cartId,
                             @RequestParam("custId") String custId) throws Exception {
        cartService.remove(cartId);
        return "redirect:/cart?id=" + custId;
    }




}
