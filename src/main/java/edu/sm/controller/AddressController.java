package edu.sm.controller;

import edu.sm.dto.Address;
import edu.sm.dto.Cust;
import edu.sm.service.AddressService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class AddressController {

    private final AddressService addressService;

    /** 1) 주소 목록 */
    @GetMapping("/addresses")
    public String list(HttpSession session, Model model) {
        Cust login = (Cust) session.getAttribute("logincust");
        List<Address> addresses = addressService.getByCustId(login.getCustId());
        model.addAttribute("addresses", addresses);
        return "cust/addresslist";   // → /views/cust/addressList.jsp
    }

    /** 2) 등록 폼 */
    @GetMapping("/address/add")
    public String addForm(Model model) {
        model.addAttribute("address", new Address());
        return "cust/addressform";   // → /views/cust/addressForm.jsp
    }

    /** 3) 등록 처리 */
    @PostMapping("/address/add")
    public String add(@ModelAttribute Address address, HttpSession session) {
        Cust login = (Cust) session.getAttribute("logincust");
        address.setCustId(login.getCustId());
        addressService.add(address);
        return "redirect:/mypage/addresses";
    }

    /** 4) 수정 폼 */
    @GetMapping("/address/edit")
    public String editForm(@RequestParam("addressId") int addressId,
                           HttpSession session, Model model) {
        Cust login = (Cust) session.getAttribute("logincust");
        // 로그인한 고객의 주소 리스트에서 해당 ID 검색
        Address target = addressService.getByCustId(login.getCustId()).stream()
                .filter(a -> a.getAddressId() == addressId)
                .findFirst()
                .orElse(new Address());
        model.addAttribute("address", target);
        return "cust/addressform";   // same form 재활용
    }

    /** 5) 수정 처리 */
    @PostMapping("/address/edit")
    public String edit(@ModelAttribute Address address) {
        addressService.edit(address);
        return "redirect:/mypage/addresses";
    }

    /** 6) 삭제 */
    @GetMapping("/address/delete")
    public String delete(@RequestParam("addressId") int addressId) {
        addressService.remove(addressId);
        return "redirect:/mypage/addresses";
    }
}
