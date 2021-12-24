---
title: "async, await 익숙해지기 (2)"
tags: ["JS"]
cover: solve.jpg
author: mmyeon
---

## 진행 방식

- 코드 예문을 따라 써보면서 개념을 복습하는 시간을 가지려고 한다.

---

## 결과 예측하기

```js
async function test() {
  await foo(1, 2000);
  await foo(2, 500);
  await foo(3, 1000);
}

function foo(num, sec) {
  setTimeout(function() {
    console.log(num);
  }, sec);
}

test();

// 2
// 3
// 1
```

## 왜 동기적으로 처리되지 않는가?

`foo함수`가 프로미스를 리턴하지 않기 때문에 `await`가 동기적으로 처리할 수 없다.
`await`는 프로미스를 받기 때문에 `foo함수`가 프로미스 객체를 리턴해줘야 한다.

## 해당 코드가 동기적으로 작동하려면?

`await`가 프로미스를 받도록 변경하면 된다.

```js
async function test() {
  await foo(1, 2000);
  await foo(2, 500);
  await foo(3, 1000);
}

function foo(num, sec) {
  return new Promise(function(resolve, reject) {
    setTimeout(function() {
      console.log(num);
      resolve("haha");
    }, sec);
  });
}

test();

// 1
// 2
// 3
```

## test함수를 async,await에서 Promise로 바꿔보기

```js
function test() {
  foo(1, 2000)
    .then(() => {
      return foo(2, 500);
    })
    .then(() => {
      return foo(3, 1000);
    });
}

function foo(num, sec) {
  return new Promise(function(resolve, reject) {
    setTimeout(function() {
      console.log(num);
      resolve("haha");
    }, sec);
  });
}

test();
```

## async함수를 중첩으로 사용했을 때 await의 동작 방식

### 예제

```js
async function test() {
  async function goo() {
    await foo(1, 1000);
  }
  goo();
  await foo(2, 500);
  await foo(3, 1000);
}

test();

// 2
// 1
// 3
```

```js
async function test() {
  async function goo() {
    await foo(1, 1000);
  }
  await goo();
  await foo(2, 500);
  await foo(3, 1000);
}

test();
// 1
// 2
// 3
```

## 예제1과 예제2의 차이

`async함수(test함수)`의 내부에 또 다른 `async 함수(goo함수)`가 중첩되었을 때는
`goo함수` 내부에 `await`가 쓰였을지라도 함수 호출할 때 `await`를 사용하지 않으면 동기적으로 작동하지 않는다.

---

### 참고

[[JS] async/await으로 콜백지옥을 해결해보자](https://victorydntmd.tistory.com/87?category=704012)
