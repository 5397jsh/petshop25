package edu.sm.service;

import edu.sm.dto.Address;
import edu.sm.repository.AddressRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AddressService {

    final AddressRepository addressRepository;

    public List<Address> getByCustId(String custId) throws Exception {
        return addressRepository.selectByCustId(custId);
    }
}
