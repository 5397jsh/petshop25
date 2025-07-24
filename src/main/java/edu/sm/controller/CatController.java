package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

@Controller
@RequestMapping("/cat")
public class CatController {
    String dir = "cat/";
    @GetMapping("/bathroom")
    public String showBathroomPage() {
        return "cat/bathroom";
    }

    @GetMapping("/house")
    public String showHousePage() {
        return "cat/house";
    }

    @GetMapping("/food")
    public String showFoodPage() {
        return "cat/food";
    }

    @GetMapping("/snack")
    public String snack(Model model) {
        model.addAttribute("title", "고양이 간식");
        model.addAttribute("center", dir + "snack.jsp");
        return "layout";
    }
    @GetMapping("/toy")
    public String showToyPage() {
        return "cat/toy";
    }

    @GetMapping("/sand")
    public String showSandPage() {
        return "cat/sand";
    }

}
