package com.example.demo.entity;

public class BaseAdminUser {
    private Long id;

    private String sysUserName;

    private String sysUserPwd;

    private Long roleId;

    private String userPhone;

    private String regTime;

    private Long userStatus;

    public BaseAdminUser(Long id, String sysUserName, String sysUserPwd, Long roleId, String userPhone, String regTime, Long userStatus) {
        this.id = id;
        this.sysUserName = sysUserName;
        this.sysUserPwd = sysUserPwd;
        this.roleId = roleId;
        this.userPhone = userPhone;
        this.regTime = regTime;
        this.userStatus = userStatus;
    }

    public BaseAdminUser() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSysUserName() {
        return sysUserName;
    }

    public void setSysUserName(String sysUserName) {
        this.sysUserName = sysUserName == null ? null : sysUserName.trim();
    }

    public String getSysUserPwd() {
        return sysUserPwd;
    }

    public void setSysUserPwd(String sysUserPwd) {
        this.sysUserPwd = sysUserPwd == null ? null : sysUserPwd.trim();
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone == null ? null : userPhone.trim();
    }

    public String getRegTime() {
        return regTime;
    }

    public void setRegTime(String regTime) {
        this.regTime = regTime == null ? null : regTime.trim();
    }

    public Long getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(Long userStatus) {
        this.userStatus = userStatus;
    }
}