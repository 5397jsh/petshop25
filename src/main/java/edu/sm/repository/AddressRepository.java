package edu.sm.repository;

import edu.sm.dto.Address;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AddressRepository {

    /** 고객ID로 저장된 주소 전체 조회 */
    List<Address> selectByCustId(@Param("custId") String custId);

    /** 새 주소 등록 */
    void insertAddress(Address address);

    /** 기존 주소 수정 */
    void updateAddress(Address address);

    /** 주소 삭제 */
    void deleteAddress(@Param("addressId") int addressId);
}
