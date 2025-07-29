package edu.sm.dto;
import lombok.*;

import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
@Builder
public class OrderDetail {
    private int orderDetailId;
    private int orderId;
    private int productId;
    private int productQt; // 장바구니 수량 참고
}