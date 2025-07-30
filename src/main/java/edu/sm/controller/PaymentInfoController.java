package edu.sm.controller;

import edu.sm.dto.Cust;
import edu.sm.dto.PaymentInfo;
import edu.sm.service.PaymentInfoService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class PaymentInfoController {

    final PaymentInfoService paymentInfoService;

    /**
     * [GET] /paymentinfo
     * 현재 로그인한 사용자의 마지막 저장된 결제정보 조회
     */
    @GetMapping("/paymentinfo")
    @ResponseBody  // ← 중요: JSON 응답을 위해 꼭 필요!
    public PaymentInfo getPaymentInfo(HttpSession session) {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) return null;

        PaymentInfo info = paymentInfoService.getPaymentInfo(cust.getCustId());
        return info;
    }

    /**
     * [POST] /paymentinfo
     * 현재 로그인한 사용자의 결제정보 저장 또는 업데이트
     */
    @PostMapping("/paymentinfo")
    public void savePaymentInfo(HttpSession session, @RequestBody PaymentInfo info) {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust != null) {
            info.setCustId(cust.getCustId());  // 보안상 세션에서 custId 설정
            paymentInfoService.saveOrUpdate(info);
        }
    }
}
