package com.linker.direct.user.entity;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class User {
    private Integer id;
    private String pwd;
    private String name;
    private String email;
    private String phoneNumber;
    private String birthday;
    private String zipcode;
    private String address;
    private String state;
    private String status;
    private String joinDate;
    private int point;

    public User(){};

    public User(Integer id, String pwd, String name, String email, String phoneNumber, String birthday, String zipcode, String address, String state, String status, String joinDate, int point) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.birthday = birthday;
        this.zipcode = zipcode;
        this.address = address;
        this.state = state;
        this.status = status;
        this.joinDate = joinDate;
        this.point = point;
    }
}
