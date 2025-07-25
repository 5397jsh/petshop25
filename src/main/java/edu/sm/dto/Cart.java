package edu.sm.dto;

import lombok.*;

import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Cart {
    private String custId;
    private int productId;
    private int productQt;
    private Timestamp cartRegdate;
    // Join Data
    private String productName;
    private int productPrice;
    private String productImg;
}
