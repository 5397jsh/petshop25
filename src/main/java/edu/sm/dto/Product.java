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
public class Product {
    private int productId;
    private String productName;
    private int productPrice;
    private Double discountRate;
    private String productImg;
    private Timestamp productRegdate;
    private Timestamp productUpdate;
    private int cateId;
    private String cateName;
    private MultipartFile productImgFile;
    private Integer soldQty;   // order_detail.order_qt 합계가 매핑될 필드
}