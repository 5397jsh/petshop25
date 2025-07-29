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
    public String manage(Model model) throws Exception {
        List<Cust> custList = custService.get();  // 전체 회원 조회
        model.addAttribute("custList", custList);
        return "manage/main";
    }
    @GetMapping("/manage/detail")
    public String detail(@RequestParam("id") String id, Model model) throws Exception {
        Cust cust = custService.get(id);
        model.addAttribute("cust", cust);
        return "manage/detail"; // manage/detail.jsp에서 회원 정보 출력
    }




    @GetMapping("/delete")
    public String delete(Model model, @RequestParam("id") String id) throws Exception {
        custService.remove(id);
        return "redirect:/manage";  // 삭제 후 목록으로 리다이렉트
    }


    @RequestMapping("/manage/update")
    public String custEdit(@RequestParam("id") String id, Model model) throws Exception {
        Cust cust = custService.get(id);
        model.addAttribute("cust", cust);
        return "manage/update";  // edit.jsp에서 폼에 데이터 채워넣기
    }

    @RequestMapping("/updateimpl")
    public String udpateimpl(Model model, Cust cust) throws Exception {
        custService.modify(cust);
        return "redirect:/manage";
    }
}
