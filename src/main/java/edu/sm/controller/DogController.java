package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dog")
public class DogController {

    @GetMapping("/bathitem")
    public String showBathroomPage() {
        return "dog/bathitem";
    }

    @GetMapping("/house")
    public String showHousePage() {
        return "dog/house";
    }

    @GetMapping("/food")
    public String showFoodPage() {
        return "dog/food";
    }

    @GetMapping("/snack")
    public String showSnackPage() {
        return "dog/snack"; // src/main/webapp/views/dog/snack.jsp
    }

    @GetMapping("/toy")
    public String showToyPage() {
        return "dog/toy";
    }

    @GetMapping("/rope")
    public String showSandPage() {
        return "dog/rope";
    }
}
