package edu.sm.dto;
import lombok.*;

import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
@Builder
public class OrderItem {
    private String productImg;    // 상품 썸네일 경로
    private String productName;   // 상품명
    private int    quantity;      // 수량
    private int    unitPrice;     // 단가
    private int    subtotal;      // 합계 (quantity * unitPrice)
}