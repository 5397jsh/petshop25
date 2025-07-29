package edu.sm.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category {
    private int cateId;
    private String cateUp;
    private String cateDown;
}