---
title: "문제42 : 2020년"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 주어진 날짜가 무슨 요일인지 알려주기🔥

## 나의 접근법

- 연도는 2020으로 고정
- 입력받은 두 값을 new Date 생성자에 전달하기
- 타겟날짜의 요일 구하기(getDay 메서드)
- 요일을 배열로 저장하기
- 배열 인덱스로 리턴값 가져오기

```js
const DAY_OF_WEEK = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];

function solution() {
  const year = 2020;
  const month = prompt("월을 입력하세요");
  const date = prompt("일을 입력하세요");
  const targetDate = new Date(`${month} ${date}, ${year}`);
  const dayIndex = targetDate.getDay();
  const result = DAY_OF_WEEK[dayIndex];

  return result;
}

solution();
```

---

## WILT : What I Learned Today 🤔

- 코드를 소리내서 설명해보자
  > `new Date 생성자`에 전달해서 `Date 객체`를 만든다<br>
  >
  > `Date 객체`의 getDay() 메서드를 사용한다
- 전역변수는 진짜 불가피할때만 사용하기
- 상수는 일반 변수와 다르게 대문자와 스네이크 케이스로 작성하기
- 변수명은 의미가 명확하도록 작성하기 (`index` => `dayIndex`)
