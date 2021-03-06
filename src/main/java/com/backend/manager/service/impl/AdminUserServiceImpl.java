package com.backend.manager.service.impl;

import com.backend.manager.response.PageDataResult;
import com.backend.manager.service.AdminUserService;
import com.backend.manager.util.SnowflakeIdWorker;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.backend.manager.common.utils.DigestUtils;
import com.backend.manager.dto.AdminUserDTO;
import com.backend.manager.pojo.BaseAdminUser;
import com.backend.manager.dao.BaseAdminUserMapper;
import com.backend.manager.dto.UserSearchDTO;
import com.backend.manager.common.utils.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Title: AdminUserServiceImpl
 * @Description:
 * @author: youqing
 * @version: 1.0
 * @date: 2018/11/21 11:04
 */
@Service
public class AdminUserServiceImpl implements AdminUserService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private BaseAdminUserMapper baseAdminUserMapper;

    @Override
    public PageDataResult getUserList(UserSearchDTO userSearch, Integer pageNum, Integer pageSize) {
        PageDataResult pageDataResult = new PageDataResult();
        List<AdminUserDTO> baseAdminUsers = baseAdminUserMapper.getUserList(userSearch);

        PageHelper.startPage(pageNum, pageSize);

        if(baseAdminUsers.size() != 0){
            PageInfo<AdminUserDTO> pageInfo = new PageInfo<>(baseAdminUsers);
            pageDataResult.setList(baseAdminUsers);
            pageDataResult.setTotals((int) pageInfo.getTotal());
        }

        return pageDataResult;
    }


    @Override
    public Map<String,Object> addUser(BaseAdminUser user) {
        Map<String,Object> data = new HashMap();
        try {
            BaseAdminUser old = baseAdminUserMapper.getUserByUserName(user.getSysUserName(),null);
            if(old != null){
                data.put("code",0);
                data.put("msg","?????????????????????");
                logger.error("??????[??????]?????????=?????????????????????");
                return data;
            }
            String phone = user.getUserPhone();
            if(phone.length() != 11){
                data.put("code",0);
                data.put("msg","????????????????????????");
                logger.error("?????????[???????????????]?????????=????????????????????????");
                return data;
            }
            String username = user.getSysUserName();
            if(user.getSysUserPwd() == null){
                String password = DigestUtils.Md5(username,"123456");
                user.setSysUserPwd(password);
            }else{
                String password = DigestUtils.Md5(username,user.getSysUserPwd());
                user.setSysUserPwd(password);
            }
            user.setRegTime(DateUtils.getCurrentDate());
            user.setUserStatus(1);
            //user.setId(Integer.valueOf(SnowflakeIdWorker.generateStringId()));
            int result = baseAdminUserMapper.insertSelective(user);
            if(result == 0){
                data.put("code",0);
                data.put("msg","???????????????");
                logger.error("??????[??????]?????????=???????????????");
                return data;
            }
            data.put("code",1);
            data.put("msg","???????????????");
            logger.info("??????[??????]?????????=???????????????");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("??????[??????]?????????", e);
            return data;
        }
        return data;
    }


    @Override
    public Map <String, Object> updateUser(BaseAdminUser user) {
        Map<String,Object> data = new HashMap();
        Integer id = user.getId();
        BaseAdminUser old = baseAdminUserMapper.getUserByUserName(user.getSysUserName(),id);
        if(old != null){
            data.put("code",0);
            data.put("msg","?????????????????????");
            logger.error("??????[??????]?????????=?????????????????????");
            return data;
        }
        String username = user.getSysUserName();
        if(user.getSysUserPwd() != null){
            String password = DigestUtils.Md5(username,user.getSysUserPwd());
            user.setSysUserPwd(password);
        }

        int result = baseAdminUserMapper.updateUser(user);
        if(result == 0){
            data.put("code",0);
            data.put("msg","???????????????");
            logger.error("??????[??????]?????????=???????????????");
            return data;
        }
        data.put("code",1);
        data.put("msg","???????????????");
        logger.info("??????[??????]?????????=???????????????");
        return data;
    }

    @Override
    public BaseAdminUser getUserById(Integer id) {
        return baseAdminUserMapper.selectByPrimaryKey(id);
    }


    @Override
    public Map <String, Object> delUser(Integer id,Integer status) {
        Map<String, Object> data = new HashMap<>();
        try {
            // ????????????
            int result = baseAdminUserMapper.updateUserStatus(id,status);
            if(result == 0){
                data.put("code",0);
                data.put("msg","??????????????????");
                logger.error("??????????????????");
                return data;
            }
            data.put("code",1);
            data.put("msg","??????????????????");
            logger.info("??????????????????");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("?????????????????????", e);
        }
        return data;
    }

    @Override
    public Map <String, Object> recoverUser(Integer id, Integer status) {
        Map<String, Object> data = new HashMap<>();
        try {
            int result = baseAdminUserMapper.updateUserStatus(id,status);
            if(result == 0){
                data.put("code",0);
                data.put("msg","??????????????????");
            }
            data.put("code",1);
            data.put("msg","??????????????????");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("?????????????????????", e);
        }
        return data;
    }

    @Override
    public BaseAdminUser findByUserName(String userName) {
        return baseAdminUserMapper.findByUserName(userName);
    }


    @Override
    public int updatePwd(String userName, String password) {
        password = DigestUtils.Md5(userName,password);
        return baseAdminUserMapper.updatePwd(userName,password);
    }
}
