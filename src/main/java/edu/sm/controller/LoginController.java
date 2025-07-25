package edu.sm.controller;

import edu.sm.dto.Cust;
import edu.sm.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class LoginController {

    final CustService custService;

    @RequestMapping("/")
    public String home() {
        return "index"; // index.jsp 직접 보여줌
    }

    @RequestMapping("/login")
    public String login() {
        return "login"; // login.jsp 직접 이동
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        if (session != null) session.invalidate();
        return "redirect:/login";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(@RequestParam("id") String id,
                            @RequestParam("pwd") String pwd,
                            HttpSession session,
                            Model model) {
        log.info("ID:{}, PWD:{}", id, pwd);

        try {
            Cust dbCust = custService.get(id);
            if (dbCust != null && dbCust.getCustPwd().equals(pwd)) {
                session.setAttribute("logincust", dbCust);
                return "redirect:/";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("loginstate", "fail");
        return "login"; // 실패 시 다시 로그인 페이지
    }

    @RequestMapping("/register")
    public String register() {
        return "register"; // register.jsp 직접 이동
    }

    @RequestMapping("/mainregisterimpl")
    public String mainregisterimpl(Cust cust, HttpSession session) {
        try {
            custService.register(cust);
            session.setAttribute("logincust", cust);
            return "redirect:/mypage";
        } catch (Exception e) {
            return "redirect:/register";
        }
    }

}

