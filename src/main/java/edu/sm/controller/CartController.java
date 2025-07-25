package edu.sm.controller;

import edu.sm.dto.Cart;
import edu.sm.dto.Cust;
import edu.sm.service.CartService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        Cust cust = (Cust) session.getAttribute("loginCust");

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

        return "index"; // 템플릿 메인
    }
}
