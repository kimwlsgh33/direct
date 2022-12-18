package com.linker.direct.store.dto;

import lombok.Getter;

@Getter
public class CrewDtoIm {
    private String name;
    private String nickname;

    public CrewDtoIm(String name, String nickname) {
        this.name = name;
        this.nickname = nickname;
    }
}

/*
    [ 사용법 ]
    - Service
    public CrewDto createCrew(String name, String nickname){
        CrewDto crew = new CrewDto(name, nickname); // 생성자 사용, 객체 생성
        return crew; // 객체 반환
    }

    - Controller
    public String createCrew(@RequestParam("name") String name, @RequestParam("nickname") String nickname){
        CrewDto crew = crewService.createCrew(name, nickname); // Service에서 객체를 받아옴
        return "crew/create"; // View로 객체를 넘겨줌
    }
 */