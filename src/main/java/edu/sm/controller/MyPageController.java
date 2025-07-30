package edu.sm.controller;

import edu.sm.dto.Cust;
import edu.sm.dto.OrderHistory;
import edu.sm.dto.OrderItem;
import edu.sm.service.CustService;
import edu.sm.service.OrderService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MyPageController {

    private final CustService custService;
    private final OrderService orderService;



    @RequestMapping("/mypage")
    public String mypage(HttpSession session, Model model) throws Exception {
        Cust loginCust = (Cust) session.getAttribute("logincust");
        if (loginCust == null) {
            return "redirect:/login";
        }

        // ✅ 최신 정보로 갱신
        Cust freshCust = custService.get(loginCust.getCustId());
        model.addAttribute("logincust", freshCust); // 화면용
        session.setAttribute("logincust", freshCust); // 세션도 갱신
        return "cust/mypage";
    }

    @GetMapping("/mypage/orders")
    public String showOrderHistory(HttpSession session, Model model) {
        // 세션에서 로그인한 고객 ID 꺼내기
        String custId = ((Cust)session.getAttribute("logincust")).getCustId();

        // 주문 이력 조회
        List<OrderHistory> orders = orderService.getHistory(custId);
        model.addAttribute("orders", orders);

        // 뷰 이름: /WEB-INF/views/mypage/orders.jsp
        return "cust/orderhistory";
    }

    @GetMapping("/mypage/orderDetail")
    public String orderDetail(@RequestParam int orderId, Model model) {
        // 주문 기본 정보
        OrderHistory base = orderService.getHistoryById(orderId);
        // 주문 아이템 리스트
        List<OrderItem> items = orderService.getDetails(orderId);
        model.addAttribute("base", base);
        model.addAttribute("items", items);
        return "cust/orderdetail";
    }


    // 수정 화면 보여주기
    @GetMapping("/cust/update")
    public String updateForm(Model model, HttpSession session) {
        Cust cust = (Cust) session.getAttribute("logincust");
        model.addAttribute("cust", cust); // update.jsp에 전달할 객체
        return "cust/update"; // → /WEB-INF/views/cust/update.jsp
    }

    @PostMapping("/cust/updateimpl")
    public String updateimpl(@ModelAttribute Cust cust,
                             HttpSession session,
                             RedirectAttributes redirectAttributes) throws Exception {
        // DB 수정
        custService.modify(cust);

        // DB에서 최신 정보 다시 조회 후 세션 갱신
        Cust updatedCust = custService.get(cust.getCustId());
        session.setAttribute("logincust", updatedCust);

        // ✅ 1회성 메시지 전달
        redirectAttributes.addFlashAttribute("msg", "회원정보가 성공적으로 수정되었습니다.");

        return "redirect:/mypage";
    }


    // 탈퇴 처리
    @GetMapping("/cust/delete")
    public String delete(HttpSession session) throws Exception {
        Cust cust = (Cust) session.getAttribute("logincust");
        custService.remove(cust.getCustId());
        session.invalidate(); // 세션 종료
        return "redirect:/";
    }


}
