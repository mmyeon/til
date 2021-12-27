---
title: "이벤트 드리븐 프로그래밍"
tags: ["JS"]
cover: solve.jpg
author: mmyeon
---

## 이벤트

### 이벤트 핸들러

- 이벤트가 발생하면 호출될 함수

### 이벤트 핸들러 등록

- 브라우저에게 이벤트 핸들러 호출을 위임하는 것

---

## 이벤트 핸들러 등록하는 3가지 방식

### 요소에 어트리뷰트 방식으로 등록하기

- 단점 : HTML, JS 코드가 뒤섞인다.

```jsx
<button onclick="sayHi('HI')">Click me!</button>
```

### 이벤트 핸들러 프로퍼티 방식으로 등록하기

- 단점 : 하나의 이벤트 핸들러만 바인딩 할 수 있다.

```jsx
button.onclick = function() {
  console.log("clicked");
};
```

### addEventListener 메서드 방식

- 동일한 HTML 요소에 click 이벤트 핸들러를 2개 등록하면 2개의 이벤트 핸들러가 모두 호출된다.<br>
- 여러 이벤트에 대한 이벤트 핸들러가 등록되면 등록된 순서대로 동작한다.
- 이벤트 핸들러 제거 하기 = removeEventListener
- 이벤트 발생시 호출하도록 전달된 인수가 동일해야 이벤트 핸들러가 제거된다

```jsx
button.addEventListener("click", handleClick);

button.removeEventListener("click", handleClick);
```

## 이벤트가 발생하면 이벤트 객체가 생긴다

생성된 이벤트 객체는 이벤트 핸들러에 인수로 전달된다.

```jsx
function handleClick(e) {
  console.log(e);
}
```

## 이벤트 객체는 상속 구조를 갖는다

Event, UIEvent, MouseEvent 와 같은 생성자 함수를 호출하여 이벤트 객체를 생성할 수 있다

```jsx
let e = new MouseEvent("click");
```
