package com.linker.direct.order.dto;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter @Setter
public class OrderDTO {
    private Long order_id;
    private String receiver;
    private String phone;
    private String address;
    private String address_detail;
    private String zip_code;
    private String msg;
    private String status;

    private String item_name;
    private String img_url;
    private Timestamp order_date;
}
