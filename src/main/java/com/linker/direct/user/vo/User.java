package com.linker.direct.user.vo;

import com.linker.direct.user.constant.Grade;
import com.linker.direct.user.constant.Role;
import com.linker.direct.common.Base;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter @ToString
@EqualsAndHashCode
public class User extends Base {
    private Long user_id;

    private String id;
    private String pwd;
    private String name;
    private String email;
    private String phone;
    private Role role;
    private String birthday;
    private String address;
    private String address_detail;
    private String zipcode;
    private Grade grade;
    private int point;
    private String status;

    public User(){};
    public User(Long user_id, String id, String pwd, String name, String email, String phone, Role role, String birthday, String address, String address_detail, String zipcode, Grade grade, int point) {
        this.user_id = user_id;
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.birthday = birthday;
        this.address = address;
        this.address_detail = address_detail;
        this.zipcode = zipcode;
        this.grade = grade;
        this.point = point;
        this.status = "일반";
    }
}
