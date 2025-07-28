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
        return "cust/login"; // login.jsp 직접 이동
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
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
        return "cust/login"; // 실패 시 다시 로그인 페이지
    }

    @RequestMapping("/register")
    public String register() {
        return "cust/register"; // register.jsp 직접 이동
    }

    @RequestMapping("/mainregisterimpl")
    public String mainregisterimpl(Cust cust, HttpSession session) {
        try {
            custService.register(cust);
            Cust dbCust = custService.get(cust.getCustId());
            session.setAttribute("logincust", dbCust);
            return "cust/registersuccess"; // 수정된 부분
        } catch (Exception e) {
            return "redirect:/register";
        }
    }



}
