package com.backend.manager.dto;


import lombok.Data;

/**
 * @Title: ProductSearchDTO
 * @Description:
 * @author: jack
 * @version: 1.0
 * @date: 2021/10/29
 */
@Data
public class ProductSearchDTO {
    private String name;

    private String price;

    private String startTime;

    private String endTime;

}
