package edu.sm.dto;

import lombok.*;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class Address {
    private int    addressId;      // address.address_id (PK)
    private String custId;         // address.cust_id (FK to cust)
    private String addressName;    // address.address_name (예: “본가”, “회사”)
    private String addressDetail;  // address.address_detail (도로명·상세주소)
}
