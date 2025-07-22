package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cat")
public class CatController {

    String dir = "cat/";

    @GetMapping("/snack")
    public String CatSnack(Model model) {
        return "cat/snack"; // src/main/webapp/views/cat/snack.jsp
    }
    @RequestMapping("/sand")
    public String html(Model model) {
        model.addAttribute("sand",dir+"sand"); //cat/sand.jsp
        return "index";
    }
}