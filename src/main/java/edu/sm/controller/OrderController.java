package edu.sm.controller;

import edu.sm.dto.*;
import edu.sm.service.AddressService;
import edu.sm.service.CartService;
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

    private final OrderService   orderService;
    private final CartService    cartService;
    private final AddressService addressService;

    /**
     * 1) 체크아웃 페이지 보여주기
     */
    @GetMapping("/checkout")
    public String showCheckout(HttpSession session, Model model) throws Exception {
        Cust login = (Cust) session.getAttribute("logincust");
        if (login == null) {
            return "redirect:/login";
        }
        String custId = login.getCustId();

        // 장바구니 목록 & 총액
        List<Cart> carts = cartService.findByCustId(custId);
        model.addAttribute("carts", carts);
        model.addAttribute("total", cartService.calculateTotal(carts));

        // 저장된 주소 목록
        List<Address> addresses = addressService.getByCustId(custId);
        model.addAttribute("addresses", addresses);

        // 폼 바인딩용 빈 주문 객체
        model.addAttribute("order", new OrderProduct());
        return "order/checkout";
    }

    /**
     * 2) 주문 생성 처리
     */
    @PostMapping("/create")
    public String createOrder(
            @ModelAttribute OrderProduct order,
            HttpSession session,
            Model model
    ) throws Exception {
        Cust login = (Cust) session.getAttribute("logincust");
        if (login == null) {
            return "redirect:/login";
        }
        order.setCustId(login.getCustId());

        // 장바구니 검증
        List<Cart> carts = cartService.findByCustId(login.getCustId());
        if (carts.isEmpty()) {
            model.addAttribute("msg", "장바구니가 비어있습니다.");
            return "order/fail";
        }

        // ✅ 총 결제 금액 계산 및 세팅
        int totalPrice = cartService.calculateTotal(carts);
        order.setAllPrice(totalPrice);

        // OrderDetail 리스트 생성
        List<OrderDetail> details = carts.stream()
                .map(c -> OrderDetail.builder()
                        .productId(c.getProductId())
                        .productQt(c.getProductQt())
                        .build())
                .toList();

        try {
            orderService.registerOrder(order, details);
            for (Cart c : carts) {
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
