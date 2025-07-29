package edu.sm.repository;

import edu.sm.dto.Address;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AddressRepository {
    List<Address> selectByCustId(String custId);
}
