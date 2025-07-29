package edu.sm.controller;

import edu.sm.dto.Cust;
import edu.sm.service.CustService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class CustController {

    final CustService custService;

    @RequestMapping("/manage")
    public String manage() {
        return "manage/main"; // cust/manage.jsp 직접 이동
    }

    @RequestMapping("/add")
    public String custAdd() {
        return "manage/add"; // cust/manage.jsp 직접 이동
    }

    @GetMapping("/delete")
    public String delete(Model model, @RequestParam("id") String id) throws Exception {
        custService.remove(id);
        return "manage/delete";
    }
//    @PostMapping("/deleteimpl")
//    public String deleteImpl(@RequestParam("custId") int id) throws Exception {
//        custService.remove(id);
//        return "redirect:/manage";
//    }

    @RequestMapping("/edit")
    public String custEdit() {
        return "manage/edit"; // cust/manage.jsp 직접 이동
    }
    @RequestMapping("/updateimpl")
    public String udpateimpl(Model model, Cust cust) throws Exception {
        custService.modify(cust);
        return "redirect:/manage/detail?id="+cust.getCustId();
    }
}
