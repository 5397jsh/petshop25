package edu.sm.dto;

import lombok.Data;
import java.util.Date;

@Data
public class Cust {
    private String custId;
    private String custPwd;
    private String custMail;
    private String custName;
    private String custPhone;
    private String custAddress;
    private Date custRegdate;
    private Date custUpdate;
}
