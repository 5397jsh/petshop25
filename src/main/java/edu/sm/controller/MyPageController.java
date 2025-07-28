package edu.sm.controller;

import edu.sm.dto.Cust;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
public class MyPageController {

    @RequestMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
        Cust cust = (Cust) session.getAttribute("logincust");
        if (cust == null) {
            return "redirect:/login";
        }
        model.addAttribute("cust", cust);
        return "cust/mypage";
    }

}
