package edu.sm.service;

import edu.sm.dto.PaymentInfo;
import edu.sm.repository.PaymentInfoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PaymentInfoService {

    final PaymentInfoRepository paymentInfoRepository;

    // 결제 정보 가져오기
    public PaymentInfo getPaymentInfo(String custId){
        return paymentInfoRepository.selectByCustId(custId);
    }

    // 결제 정보 저장 또는 업데이트
    public void saveOrUpdate(PaymentInfo info) {
        paymentInfoRepository.insertOrUpdate(info);
    }
}
