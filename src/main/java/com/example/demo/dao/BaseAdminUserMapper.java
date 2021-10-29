package com.example.demo.dao;

import com.example.demo.entity.BaseAdminUser;

public interface BaseAdminUserMapper {
    int insert(BaseAdminUser record);

    int insertSelective(BaseAdminUser record);
}