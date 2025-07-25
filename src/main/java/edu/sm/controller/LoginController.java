package edu.sm.controller;

import edu.sm.dto.Cust;
import edu.sm.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
public class LoginController {

    final CustService custService;

    public LoginController(CustService custService) {
        this.custService = custService;
    }

    // 로그인 페이지로 이동
    @GetMapping("/login")
    public String login() {
        return "login"; // login.jsp를 반환
    }

    // 로그인 처리
    @PostMapping("/login")
    public String loginImpl(@RequestParam("id") String id,
                            @RequestParam("pwd") String pwd,
                            HttpSession session,
                            Model model) {
        try {
            Cust cust = custService.get(id);
            if (cust != null && cust.getCust_pwd().equals(pwd)) {
                session.setAttribute("loginCust", cust);
                return "redirect:/"; // 로그인 성공 시 메인으로
            } else {
                model.addAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
                return "login";
            }
        } catch (Exception e) {
            model.addAttribute("msg", "로그인 중 오류 발생");
            return "login";
        }
    }
}
