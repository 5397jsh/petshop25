package edu.sm.controller;

import edu.sm.dto.Cart;
import edu.sm.dto.Cust;
import edu.sm.dto.OrderDetail;
import edu.sm.dto.OrderProduct;
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

    final OrderService orderService;
    final CartService cartService;

    /** [1] 주문 페이지 진입 (GET) */
    @GetMapping("/checkout")
    public String checkoutGet(@RequestParam("custId") String custId, Model model) throws Exception {
        List<Cart> cartList = cartService.findByCustId(custId);
        model.addAttribute("carts", cartList);
        return "order/checkout"; // → /WEB-INF/views/order/checkout.jsp
    }

    /** [1-2] 주문 페이지 진입 (POST) - cart.jsp에서 POST로 호출 */
    @PostMapping("/checkout")
    public String checkoutPost(@RequestParam("custId") String custId, Model model) throws Exception {
        List<Cart> cartList = cartService.findByCustId(custId);
        model.addAttribute("carts", cartList);
        return "order/checkout"; // → /WEB-INF/views/order/checkout.jsp
    }

    /** [2] 주문 생성 처리 (POST) */
    @PostMapping("/create")
    public String createOrder(
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("totalPrice") int totalPrice,
            HttpSession session,
            Model model
    ) {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) {
            return "redirect:/login";
        }

        try {
            List<Cart> cartList = cartService.findByCustId(cust.getCustId());
            if (cartList == null || cartList.isEmpty()) {
                model.addAttribute("msg", "장바구니가 비어있습니다.");
                return "order/fail"; // → /WEB-INF/views/order/fail.jsp (미구현 시 에러)
            }

            // 주문 정보 생성
            OrderProduct order = OrderProduct.builder()
                    .custId(cust.getCustId())
                    .receiverName(receiverName)
                    .receiverAddress(receiverAddress)
                    .receiverPhone(receiverPhone)
                    .allPrice(totalPrice)
                    .build();

            // 주문 상세 생성
            List<OrderDetail> detailList = new ArrayList<>();
            for (Cart c : cartList) {
                OrderDetail detail = OrderDetail.builder()
                        .productId(c.getProductId())
                        .productQt(c.getProductQt())
                        .build();
                detailList.add(detail);
            }

            // 서비스 처리
            orderService.registerOrder(order, detailList);

            // 장바구니 비우기
            for (Cart c : cartList) {
                cartService.remove(c.getCartId());
            }

            return "order/success"; // → /WEB-INF/views/order/success.jsp

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg", "주문 중 오류가 발생했습니다.");
            return "order/fail";
        }
    }
}