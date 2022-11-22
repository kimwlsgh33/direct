package com.linker.direct.store.dto;

// Dto 기본 형식
import lombok.Getter;
import lombok.Setter;

@Getter @Setter // DTO속에는 getter, setter만 있고, 비즈니스 로직은 Service에서 만들어서 사용한다.
public class CrewDto {
    private String name;
    private String nickname;
}

/*
    [ 사용법 ]
    - Service ( 비즈니스 로직 )
    public CrewDto createCrew(String name, String nickname){
        CrewDto crew = new CrewDto(); // 기본 생성자 사용, 객체 생성
        crew.setName(name);
        crew.setNickname(nickname); // setter 사용한 값 할당
        return crew; // 객체 반환
    }

    - Controller
    public String createCrew(@RequestParam("name") String name, @RequestParam("nickname") String nickname){
        CrewDto crew = crewService.createCrew(name, nickname); // Service에서 객체를 받아옴
        return "crew/create"; // View로 객체를 넘겨줌
    }

 */