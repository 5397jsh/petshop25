package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cat")
public class CatController {

    @GetMapping("/snack")
    public String showSnackPage() {
        return "cat/snack"; // src/main/webapp/views/cat/snack.jsp
    }
}
