---
title: "변수 다루기"
tags: ["Clean Code"]
cover: solve.jpg
author: mmyeon
---

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

### 블록 스코프인 `let`, `const` 사용하기

```js
let global = "전역";

if (global === "전역") {
  let global = "지역";

  console.log(global); // "지역"
}

console.log(global); // "전역"
```

### 전역 공간 사용을 최소화하기

전역 스코프를 가지면 최상위 스코프라 어디서나 접근이 가능해서 값을 변경할 수 있기 때문에 오류가 날 가능성이 높다

전역공간 = 최상위공간

브라우저에서의 전역 공간 = 윈도우 객체
nodeJS의 전역 공간 = 글로벌

방법

- 전역 변수 만들지 않는다

- 지역변수로 만들기

- window.global을 조작하지 않는다.

- const, let 사용하기

- 즉시실행함수. 모듈 ,클로저, 스코프 나누기 추천

### 임시 변수 제거하기

임시 변수 = 스코프 안에서 전역변수처럼 사용되는 활용되는 변수

함수 내부에서 선언되어서 값이 계속 바뀌는 변수 선언 줄이기.

### before

```jsx
function getElements() {
  const result = {};

  result.title = document.querySelector(".title");
  result.text = document.querySelector(".text");
  result.value = document.querySelector(".value");

  return result;
}
```

### after

```jsx
function getElements() {
  return {
    title: document.querySelector(".title"),
    text: document.querySelector(".text"),
    value: document.querySelector(".value")
  };
}
```

기억하기!

함수는 하나의 일만 하는게 좋다. 그러려면 임시 변수가 내부에서 값을 바꾸는 걸 최소화하는게 좋다.

임시 변수가 존재하는 순간 함수가 하나 이상의 역할을 하기 쉬움

### 호이스팅 주의하기

런타임에(코드 동작할 때) 선언과 할당이 분리되는 것을 의미 함.

변수 선언하고 할당해서 초기화를 하면 호이스팅 막을 수 있다.

함수 만들 때 const 로 만들고 함수 할당하기 - 함수 표현식 사용하기

### 임시 변수 제거하기

임시 변수 = 스코프 안에서 전역변수처럼 사용되는 활용되는 변수

함수 내부에서 선언되어서 값이 계속 바뀌는 변수 선언 줄이기.

### before

```jsx
function getElements() {
  const result = {};

  result.title = document.querySelector(".title");
  result.text = document.querySelector(".text");
  result.value = document.querySelector(".value");

  return result;
}
```

### after

```jsx
function getElements() {
  return {
    title: document.querySelector(".title"),
    text: document.querySelector(".text"),
    value: document.querySelector(".value")
  };
}
```

기억하기!

함수는 하나의 일만 하는게 좋다. 그러려면 임시 변수가 내부에서 값을 바꾸는 걸 최소화하는게 좋다.

임시 객체가 생기는 순산 계속 접근해서 뭔가 만들고 넣고 지우고 반복

추가 요청사항이 있을 떄 개선하기 어려움

이 함수를 프로젝트 곳곳에서 100군데에서 쓰인다고 가정하면 그 내용을 알지 못하고 수정하면 문제 발생 가능성 높음

따라서 바로 리턴해주는게 좋다

let → 수정해서 재할당한다는 의미이므로 const로 변경하고

바로 리턴하도록 바꾸기

결국 임시 변수를 내부에서 바꾸는 역할을 최소화하기

하나의 함수는 하나의 일만 하도록

```jsx
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a1c43dac-9c50-47a4-981b-8ba34f7769d9/Untitled.png)

더 나은 방법

함수를 만들 때 함수 내부에 있는 임수 변수를 조작하지 못하도록 하기

임시변수가 함수가 한번 동작하는 동안 값이 매우 많이 바뀌는 놀라운 매직! 이 값이 무엇인지 예측하지 어려움.

임시변수 제거해야 하는 이유

추가적으로 값을 변경할 가능성이 높음

임시 변수가 존재하는 순간 함수가 하나 이상의 역할을 하기 쉬움

### 호이스팅 주의하기

런타임시기(코드 동작할 때) 선언과 할당의 분리를 의미 함

변수 선언하고 할당해서 초기화를 하면 호이스팅 막을 수 있다.

함수 만들 때 const 로 만들고 함수 할당하기 - 함수 표현식 사용하기

호이스팅

런타임시에 선언이 최상단으로 끌어올려짐

코드 작성 → 예측 핮 ㅣ못하는 결과 가져옴

런타임시에 선언이 최상단으로 끌어올려짐

### 참고

[클린코드 자바스크립트](https://www.udemy.com/course/clean-code-js/)
