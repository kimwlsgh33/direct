package com.linker.direct.user.vo;

import com.linker.direct.common.Base;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter @ToString
@EqualsAndHashCode
public class Address extends Base {
    private Long address_id;
    private Long user_id;
    private String receiver;
    private String phone;
    private String address;
    private String address_detail;
    private String zip_code;
    private String status;
//    private String address_type;

    public Address(Long address_id, Long user_id, String receiver, String phone, String address, String address_detail, String zip_code) {
        this.address_id = address_id;
        this.user_id = user_id;
        this.receiver = receiver;
        this.phone = phone;
        this.address = address;
        this.address_detail = address_detail;
        this.zip_code = zip_code;
        this.status = "일반";
    }
}
