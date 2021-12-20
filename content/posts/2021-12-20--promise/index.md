---
title: "프로미스"
tags: ["JS"]
cover: solve.jpg
author: mmyeon
---

### 프로미스

콜백 패턴이 가지는 단점인 콜백 헬과 에러 처리의 여려움을 보완하기 위해서 ES6에서 등장했다.<br>

> 프로미스는 비동기 처리 상태와 처리 결과를 관리하는 객체이다

### 비동기함수를 살펴보자

```jsx
// GET 요청을 위한 비동기 함수
const get = url => {
  const xhr = new XMLHttpRequest();
  xhr.open("GET", url);
  xhr.send();

  xhr.onload = () => {
    if (xhr.status === 200) {
      console.log(JSON.parse(xhr.response));
    } else {
      console.error(`${xhr.statue} ${xhr.statusText}`);
    }
  };
};

get("https://jsonplaceholder.typicode.com/todos/1");
```

1. get 비동기 함수 호출
2. `XMLHttpRequest객체` 생성
3. HTTP 요청 초기화한 후, HTTP 요청 전송함
4. `xhr.onload 이벤트 핸들러`를 바인딩하고 종료함
5. get 함수는 `xhr.onload 이벤트 핸들러`가 바로 실행되지 않기 때문에 `undefined`를 리턴함

### 콜백헬이 발생하는 이유는

비동기 처리 결과를 외부에 반환할 수 없고 상위 스코프의 변수에 할당할 수도 없다.<br>
따라서 내부에서 비동기 처리 성공과 실패를 처리할 각각의 콜백을 전달해야 한다.<br>
콜백이 중첩되기 시작한다.<br>
예를 들면 사용자 아이디를 서버로부터 가져와서, 다시 그 데이터를 사용해서 유저 정보를 얻어오는 GET 요청을 날릴 경우에 해당한다.

### 콜백헬의 큰 문제점

에러 처리가 곤란하다.

```jsx
try {
  setTimeout(() => {
    throw new Error("Error!");
  }, 1000);
} catch (error) {
  console.log("캐치한 에러", e);
}
```

<b>작동 원리</b>

- 비동기 함수인 `setTimeout 함수` 호출됨
- `setTimeout 함수`의 실행 컨텍스트가 생성되어 콜 스택에 푸쉬되고 실행됨
- 비동기 함수이기 때문에 콜백 함수가 호출되는 것을 기다리지 않고 즉시 종료되어 콜 스택에서 제거됨
- 이후 타이머가 만료되면 setTimeout 함수의 콜백함수는 태스크 큐로 푸쉬됨
- 콜 스택이 비어져 있을 때 이벤트 루프에 의해 콜 스택으로 푸쉬되어 실행됨
- 따라서 catch 코드 불록에서 에러가 캐치되지 않음

### 에러 처리하는 방법

`try...catch...finally`

- 중요한 이유 <br>
  프로그램이 강제 종료되지 않도록 에러를 처리할 수 있다.

- 작동 순서<br>
  `try...catch...finally` 문에서 try 블럭 실행된다.<br>
  에러 발생하면 catch문의 err 변수로 전달되고 catch문 실행된다.<br>
  finally 코드 블록은 에러 발생과 상관없이 반드시 한 번 실행된다.<br>

### 프로미스 생성

`Promise 생성자 함수`를 `new 연산자`와 함께 호출하면 프로미스 객체가 만들어진다.<br>
비동기 처리를 할 콜백 함수(resolve함수, reject함수)를 인수로 전달받는다.<br>
프로미스 함수의 콜백함수 내부에서 비동기 처리를 수행한다

```jsx
const promise = new Promise((resolve, reject) => {
  if (success) {
    resolve("result");
  } else {
    reject("failure reason");
  }
});
```

```jsx
const PromiseGet = url => {
  return new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.open("GET", url);
    xhr.send();

    // XMLHttpRequest 처리가 완료되면 실행
    xhr.onload = () => {
      if (xhr.status === 200) {
        resolve(JSON.parse(xhr.response));
        console.log(JSON.parse(xhr.response));
      } else {
        reject(new Error(xhr.status));
      }
    };
  });
};

PromiseGet("https://jsonplaceholder.typicode.com/todos/1");
```

비동기 함수인 PromiseGet은 함수 내부에서 프로미스를 생성하고 반환한다.

### 프로미스의 상태

프로미스 상태는 resolve 또는 reject 함수를 호출하는 것으로 결정된다.<br>
`pending` : 비동기처리가 아직 수행되지 않은 상태, 프로미스가 생성된 직후 기본 상태<br>
`fulfilled` : 비동기 처리가 성공함, resolve 함수 호출<br>
`rejected` : 비동기 처리가 실패함, reject 함수 호출<br>
<br>
프로미스는 처리 status와 비동기 처리 결과 정보를 가진다.<br>

### 프로미스의 비동기 상태가 변화하면 할 일

프로미스의 처리 결과를 가지고 어떤 작업을 하던가, 에러 처리를 해야 한다.

### 프로미스의 후속 처리 메서드

- `then`

두 개의 콜백함수(resolve함수, reject함수)를 인수로 전달함<br>
then 메서드는 언제나 프로미스를 반환한다

```jsx
new Promise(resolve => resolve("fulfilled")).then(v => console.log(v), e => console.log(error(e)));
```

<br>

- `catch`

rejected 상태인 경우만 호출됨<br>
언제나 프로미스 반환함<br>

```js
new Promise((_, reject) => reject(new Error("rejected"))).catch(e => console.log(e));
```

<br>

- `finally`

처리 결과에 상관없이 무조건 한번 실행됨<br>
공통적으로 수행해야 할 처리 내용 있을 때 유리함<br>
언제나 프로미스 반환함<br>

```jsx
new Promise(() => {}).finally(() => console.log("finally"));
```

```jsx
const PromiseGet = url => {
  return new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.open("GET", url);
    xhr.send();

    // XMLHttpRequest 처리가 완료되면 실행
    xhr.onload = () => {
      if (xhr.status === 200) {
        resolve(JSON.parse(xhr.response));
      } else {
        reject(new Error(xhr.status));
      }
    };
  });
};

//   PromiseGet 함수는 프로미스를 반환한다
PromiseGet("https://jsonplaceholder.typicode.com/todos1")
  .then(res => console.log(res))
  .catch(err => console.log(err))
  .finally(() => console.log("Bye!"));

// Promise {<pending>}
// Error: 404
//     at XMLHttpRequest.xhr.onload (<anonymous>:12:16)
// Bye!
```

### 프로미스 에러 처리

프로미스 함수는 처리 상태와 처리 결과가 담긴 프로미스를 반환한다.<br>
이 프로미스를 가지고 `then`, `catch`, `finally`를 사용하여 비동기 처리 결과에 대한 후속 작업을 하면 된다.

```jsx
promiseGet("https://jsonplaceholder.typicode.com/todos/1")
  .then(res => console.log(res))
  .catch(err => console.log(err));
```

### 프로미스 체이닝

then, catch, finally 후속 처리 메서드를 연속적으로 호출하는 걸 뜻한다.<br>
후속 처리 메서드는 항상 프로미스를 리턴하기 때문에 프로미스 체이닝이 가능하다<br>
then → then → catch<br>

```jsx
promiseGet(`${url}/posts/1`)
  .then(({ userId }) => promiseGet(`${url}/users/${userId}`))
  .catch(err => console.log(err));
```
