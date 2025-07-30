package edu.sm.controller;

import edu.sm.dto.*;
import edu.sm.service.CartService;
import edu.sm.service.OrderService;
import edu.sm.service.PaymentInfoService;
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
    final PaymentInfoService paymentInfoService;

    @GetMapping("/checkout")
    public String checkoutGet(@RequestParam("custId") String custId, Model model) throws Exception {
        List<Cart> cartList = cartService.findByCustId(custId);
        model.addAttribute("carts", cartList);
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

            @RequestParam(value = "cardname", required = false) String cardName,
            @RequestParam(value = "cardnumber", required = false) String cardNumber,
            @RequestParam(value = "expmonth", required = false) String expMonth,
            @RequestParam(value = "expyear", required = false) String expYear,
            @RequestParam(value = "cvv", required = false) String cvv,

            HttpSession session,
            Model model
    ) {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) {
            return "redirect:/login";
        }

        // 1. 수령자 정보 유효성 검사
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

            // 주문 저장
            orderService.registerOrder(order, detailList);

            // 장바구니 비우기
            for (Cart c : cartList) {
                cartService.remove(c.getCartId());
            }

            // 결제 정보 저장
            PaymentInfo info = new PaymentInfo();
            info.setCustId(cust.getCustId());
            info.setCardName(cardName);
            info.setCardNumber(cardNumber);
            info.setExpMonth(expMonth);
            info.setExpYear(expYear);
            info.setCvv(cvv);
            paymentInfoService.saveOrUpdate(info);

            return "order/success";

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg", "주문 처리 중 예외가 발생했습니다.");
            return "order/fail";
        }
    }


}