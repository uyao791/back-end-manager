package com.backend.manager.dao;

import com.backend.manager.pojo.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    void addUser(User sysUser);

    int updateUserByName(User sysUser);

    int selectByName(String name);

    int insertSelective(User sysUser);
}