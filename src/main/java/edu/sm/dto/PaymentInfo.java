package edu.sm.dto;

import lombok.Builder;
import lombok.Data;
import java.util.Date;

@Data
@Builder
public class PaymentInfo {
    private String custId;
    private String cardName;
    private String cardNumber;
    private String expMonth;
    private String expYear;
    private String cvv;
    private Date regDate;
}
