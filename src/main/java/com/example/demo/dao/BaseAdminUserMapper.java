package com.example.demo.dao;

import com.example.demo.entity.BaseAdminUser;

public interface BaseAdminUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(BaseAdminUser record);

    int insertSelective(BaseAdminUser record);

    BaseAdminUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BaseAdminUser record);

    int updateByPrimaryKey(BaseAdminUser record);
}