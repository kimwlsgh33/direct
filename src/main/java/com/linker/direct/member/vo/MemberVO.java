package com.linker.direct.member.vo;

import com.linker.direct.member.constant.Grade;
import com.linker.direct.member.constant.Role;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class MemberVO {
    private Long user_id;
    private String id;
    private String password;
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
    private Timestamp created_at;
    private Timestamp updated_at;
    private String status;

    public MemberVO(){};
}
