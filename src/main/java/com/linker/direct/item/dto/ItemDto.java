package com.linker.direct.item.dto;

import com.linker.direct.item.vo.ItemVO;
import com.linker.direct.member.vo.MemberVO;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ItemDto {
    private Integer id;
    private MemberVO memberVO;
    private ItemVO itemVO;

    public static ItemDto of(MemberVO memberVO, ItemVO itemVO) {
        ItemDto itemDto = new ItemDto();
        itemDto.id = null;
        itemDto.memberVO = memberVO;
        itemDto.itemVO = itemVO;
        return itemDto;
    }
}
