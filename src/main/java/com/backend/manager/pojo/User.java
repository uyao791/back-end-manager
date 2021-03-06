package com.backend.manager.pojo;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    private Integer id;

    private String name;

    private String phone;

    private String address;

    private Date enrolDate;

    private String des;

    public User(Integer id, String name, String phone, String address, Date enrolDate, String des) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.enrolDate = enrolDate;
        this.des = des;
    }

    public User() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Date getEnrolDate() {
        return enrolDate;
    }

    public void setEnrolDate(Date enrolDate) {
        this.enrolDate = enrolDate;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des == null ? null : des.trim();
    }
}