package edu.sm.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
    private Integer reviewId;      // PK
    private Integer productId;     // FK → product.product_id
    private String custId;         // FK → cust.cust_id
    private Integer rating;        // 평점
    private String comment;        // 리뷰 본문 (매핑된 alias)
    private LocalDateTime commDate;// 작성일시
}
