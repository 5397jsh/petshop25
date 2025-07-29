package edu.sm.dto;
import lombok.*;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
@Builder
@Data

public class OrderHistory {
    private int orderId;
    private java.util.Date regDate;
    private String recipientName;
    private int totalAmount;
}