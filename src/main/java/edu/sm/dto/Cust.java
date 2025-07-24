package edu.sm.dto;

import lombok.Data;
import java.util.Date;

@Data
public class Cust {
    private String cust_id;
    private String cust_pwd;
    private String cust_mail;
    private String cust_name;
    private String cust_phone;
    private Date cust_regdate;
    private Date cust_update;
}
