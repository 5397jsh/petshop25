package edu.sm.repository;

import edu.sm.dto.PaymentInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PaymentInfoRepository {
    PaymentInfo selectByCustId(String custId);
    void insertOrUpdate(PaymentInfo info);
}
