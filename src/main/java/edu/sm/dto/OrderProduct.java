package edu.sm.dto;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
@Builder
public class OrderProduct {
    private int orderId;
    private String custId;
    private String receiverName;
    private String receiverAddress;
    private String receiverPhone;
    private int allPrice;
    private Timestamp orderDate;
    private int orderQt; // ← 이 필드 추가
}