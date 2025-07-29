package edu.sm.dto;

import lombok.*;
import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class Address {
    private int addressId;
    private String addressNum;
    private String addressDetail;
    private String custId;
    private Timestamp regDate;  // 옵션
}
