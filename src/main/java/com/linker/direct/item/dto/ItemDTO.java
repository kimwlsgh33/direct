package com.linker.direct.item.dto;

import com.linker.direct.item.vo.ItemVO;
import com.linker.direct.member.vo.MemberVO;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ItemDTO {
    private Integer id;
    private MemberVO memberVO;
    private ItemVO itemVO;

    public static ItemDTO of(MemberVO memberVO, ItemVO itemVO) {
        ItemDTO itemDto = new ItemDTO();
        itemDto.id = null;
        itemDto.memberVO = memberVO;
        itemDto.itemVO = itemVO;
        return itemDto;
    }
}
