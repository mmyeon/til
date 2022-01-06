---
title: "변수 다루기"
tags: ["Clean Code"]
cover: solve.jpg
author: mmyeon
---

## 블록 스코프를 가지는 `let`, `const` 사용하기

### 함수 스코프 & 블록 스코프

`var`는 함수스코프를 가지기 때문에 함수 내부에서 선언되지 않으면 전역스코프를 가지게 된다.

```js
var global = "전역";

if (global === "전역") {
  var global = "지역";

  console.log(global); // "지역"
}

console.log(global); // "지역"
```

```js
let global = "전역";

if (global === "전역") {
  let global = "지역";

  console.log(global); // "지역"
}

console.log(global); // "전역"
```

---

## 전역 공간 사용을 최소화하기

- 전역 스코프 = 최상위 스코프
- 어디서나 접근이 가능해서 값을 변경할 수 있기 때문에 오류가 날 가능성이 높다.

### 자바스크립트 환경에 따라 전역 공간이 다르다.

- 브라우저에서의 전역 공간 = 윈도우 객체
- nodeJS의 전역 공간 = 글로벌

### 개선 방법

- 전역 변수 만들지 않기
- 지역변수로 만들기
- `window.global`을 조작하지 않기
- `const`, `let` 사용하기
- 즉시실행함수, 모듈, 클로저, 스코프 나누기 사용하기

---

## 임시 변수 제거하기

- 임시 변수 = 스코프 안에서 전역변수처럼 사용되는 변수
- 함수 내부에서 선언되어서 값이 계속 바뀌는 변수 선언 줄이기.

### 예시

```jsx
// before

function getElements() {
  const result = {};

  result.title = document.querySelector(".title");
  result.text = document.querySelector(".text");
  result.value = document.querySelector(".value");

  return result;
}
```

```jsx
// after
function getElements() {
  return {
    title: document.querySelector(".title"),
    text: document.querySelector(".text"),
    value: document.querySelector(".value")
  };
}
```

### 임시 변수가 존재하는 순간 함수가 하나 이상의 역할을 하기 쉽다.

- 함수는 하나의 일만 하는게 좋다. 그러려면 내부에서 값이 바뀌는 임시변수를 최소화하는 게 좋다.

---

## 변수/함수 호이스팅 주의하기

- 호이스팅은 런타임에 선언과 할당이 분리되는 것을 의미
- 변수 선언하고 할당해서 초기화를 하면 함수 호이스팅을 막을 수 있다.
- 함수 표현식 사용하기

---

## 참고

[클린코드 자바스크립트](https://www.udemy.com/course/clean-code-js/)
