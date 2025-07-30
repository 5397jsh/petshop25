package edu.sm.dto;

import lombok.Data;
import java.util.Date;

@Data
public class PaymentInfo {
    private String custId;
    private String cardName;
    private String cardNumber;
    private String expMonth;
    private String expYear;
    private String cvv;
    private Date regDate;
}
