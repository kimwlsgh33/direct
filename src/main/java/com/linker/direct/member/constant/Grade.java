package com.linker.direct.member.constant;

public enum Grade {
    NORMAL(0), // 일반
    SILVER(1), // 실버
    GOLD(2), // 골드
    PLATINUM(3); // 플래티넘

    private int grade;

    Grade(int grade) {
        this.grade = grade;
    }

    public int getGrade() {
        return grade;
    }
}
