package com.backend.manager.dao;

import com.backend.manager.dto.ProductSearchDTO;
import com.backend.manager.pojo.Product;

import java.util.List;

public interface ProductMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Long id);

    List<Product> selectListByProduct(ProductSearchDTO record);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
}