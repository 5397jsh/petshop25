package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cat")
public class CatController {

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
    public String showSnackPage() {
        return "cat/snack"; // src/main/webapp/views/cat/snack.jsp
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
