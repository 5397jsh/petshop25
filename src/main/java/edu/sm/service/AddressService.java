package edu.sm.service;

import edu.sm.dto.Address;
import edu.sm.repository.AddressRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AddressService {

    private final AddressRepository addressRepository;

    /** 고객ID로 저장된 주소 전체 조회 */
    public List<Address> getByCustId(String custId) {
        return addressRepository.selectByCustId(custId);
    }

    /** 새 주소 등록 */
    public void add(Address address) {
        addressRepository.insertAddress(address);
    }

    /** 기존 주소 수정 */
    public void edit(Address address) {
        addressRepository.updateAddress(address);
    }

    /** 주소 삭제 */
    public void remove(int addressId) {
        addressRepository.deleteAddress(addressId);
    }
}
