package edu.sm.controller;

import edu.sm.dto.Cart;
import edu.sm.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
@Controller
@RequestMapping("/order")
@RequiredArgsConstructor
public class OrderController {

    final CartService cartService;
    String dir = "/order";

    @PostMapping("")
    public String orderPage(@RequestParam String custId, Model model) throws Exception {
        List<Cart> cartList = cartService.findByCustId(custId);
        model.addAttribute("carts", cartList);
        model.addAttribute("custId", custId);
        return "order/order"; // 주문서 화면으로 이동
    }

}
