---
title: "async, await 익숙해지기 (1)"
tags: ["JS"]
cover: solve.jpg
author: mmyeon
---

## 진행 방식

- 코드 예문을 따라 써보면서 개념을 복습하는 시간을 가지려고 한다.

---

## async 키워드

```js
async function hello() {
  return "Hello";
}
hello(); // Promise {<fulfilled>: 'Hello'}
```

함수 앞에 `async` 키워드를 사용하면 결과를 직접 반환하는 게 아니라 Promise를 반환받게 된다.

## async와 await

`async 키워드`를 써서 비동기 함수로 만들면, 내부에서 `await 키워드`를 써서 비동기 코드를 호출할 수 있다.

<b>반환된 값</b>을 사용하고 싶다면? `.then()`블럭을 사용할 수 있다.

```js
// 같은 표현
// hello().then((value) => console.log(value))
hello().then(console.log);
// Hello
```

### async, await를 사용해서 코드를 변경해보자

비동기 코드가 동기 코드처럼 보이면 직관적이라서 좋다.

```js
fetch("coffee.jpg")
  .then(response => response.blob())
  .then(myBlob => {
    let objectURL = URL.createObjectURL(myBlob);
    let image = document.createElement("img");
    image.src = objectURL;
    document.body.appendChild(image);
  })
  .catch(e => {
    console.log("There has been a problem with your fetch operation: " + e.message);
  });
```

- 처리할 작업을 순서대로 써주면 된다.

```js
async function myFetch() {
  let response = await fetch("coffee.jpg");
  let blob = await response.blob();
  let objectURL = URL.createObjectURL(myBlob);
  let image = document.createElement("img");
  image.src = objectURL;
  document.body.appendChild(image);
}

myFetch().catch(e => {
  console.log("There has been a problem with your fetch operation: " + e.message);
});
```

`.then()` 블럭을 함수 내부의 블럭으로 가져와 더 좋게 리팩토링해보자<br>
`await 키워드`는 자바스크립트 런타임이 해당 라인에서 비동기 함수 호출이 결과를 반환할 때까지 기다리게 하고 외부의 다른 동기 코드는 실행된다.

```js
async function myFetch() {
  let response = await fetch("coffee.jpg");
  if (!response.ok) {
    throw new Error(`HTTP error! status: ${response.status}`);
  }
  return await response.blob();
}

myFetch().then(
  (blob => {
    let objectURL = URL.createObjectURL(blob);
    let image = document.createElement("img");
    image.src = objectURL;
    document.body.appendChild(image);
  }).catch(e => console.log(e))
);
```

## try catch문 추가해보자

```js
async function myFetch() {
  try {
    let response = await fetch("coffee.jpg");

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    let myBlob = await response.blob();
    let objectURL = URL.createObjectURL(blob);
    let image = document.createElement("img");
    image.src = objectURL;
    document.body.appendChild(image);
  } catch (e) {
    console.log(e);
  }
}

myFetch();
```

---

### 참고

[async와 await를 사용하여 비동기 프로그래밍을 쉽게 만들기 - Web 개발 학습하기 | MDN](https://developer.mozilla.org/ko/docs/Learn/JavaScript/Asynchronous/Async_await)
