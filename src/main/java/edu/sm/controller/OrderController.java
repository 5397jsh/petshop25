package edu.sm.controller;

import edu.sm.dto.*;
import edu.sm.service.CartService;
import edu.sm.service.CustService;
import edu.sm.service.OrderService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class OrderController {

    final OrderService orderService;
    final CartService cartService;
    final CustService custService;


    @GetMapping("/checkout")
    public String checkoutGet(@RequestParam("custId") String custId, HttpSession session, Model model) throws Exception {
        // 1. 장바구니
        List<Cart> cartList = cartService.findByCustId(custId);
        model.addAttribute("carts", cartList);

        // 2. 로그인한 회원 정보 조회
        Cust loginCust = (Cust) session.getAttribute("logincust");
        if (loginCust != null) {
            Cust fullInfo = custService.get(loginCust.getCustId()); // DB에서 상세 정보
            model.addAttribute("custinfo", fullInfo);
        }

        return "order/checkout";
    }


    @PostMapping("/checkout")
    public String checkoutPost(@RequestParam("custId") String custId, Model model) throws Exception {
        List<Cart> cartList = cartService.findByCustId(custId);
        model.addAttribute("carts", cartList);
        return "order/checkout";
    }

    @PostMapping("/create")
    public String createOrder(
            @RequestParam(value = "receiverName", required = false) String receiverName,
            @RequestParam(value = "receiverAddress", required = false) String receiverAddress,
            @RequestParam(value = "receiverPhone", required = false) String receiverPhone,
            @RequestParam(value = "totalPrice", required = false, defaultValue = "0") int totalPrice,
            HttpSession session,
            Model model
    ) {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) {
            return "redirect:/login";
        }

        // 1. 입력값 유효성 검사
        if (receiverName == null || receiverName.trim().isEmpty()
                || receiverAddress == null || receiverAddress.trim().isEmpty()
                || receiverPhone == null || receiverPhone.trim().isEmpty()) {
            model.addAttribute("msg", "수령자 정보는 모두 필수입니다.");
            return "order/fail";
        }

        try {
            List<Cart> cartList = cartService.findByCustId(cust.getCustId());
            if (cartList == null || cartList.isEmpty()) {
                model.addAttribute("msg", "장바구니가 비어있습니다.");
                return "order/fail";
            }

            OrderProduct order = OrderProduct.builder()
                    .custId(cust.getCustId())
                    .receiverName(receiverName)
                    .receiverAddress(receiverAddress)
                    .receiverPhone(receiverPhone)
                    .allPrice(totalPrice)
                    .build();

            List<OrderDetail> detailList = new ArrayList<>();
            for (Cart c : cartList) {
                OrderDetail detail = OrderDetail.builder()
                        .productId(c.getProductId())
                        .productQt(c.getProductQt())
                        .build();
                detailList.add(detail);
            }

            orderService.registerOrder(order, detailList);

            for (Cart c : cartList) {
                cartService.remove(c.getCartId());
            }

            return "order/success";

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg", "주문 처리 중 예외가 발생했습니다.");
            return "order/fail";
        }
    }

}
