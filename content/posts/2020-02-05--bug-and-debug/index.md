---
title: bug and debug
tags: ["JS"]
cover: bug.jpg
author: mmyeon
---

## 에러 처리의 중요성

######자바스크립트는 프로그램을 처리하는 방식이 싱글스레드이기 때문에 에러가 발생하면 복구가 매우 어렵다.

- **싱글스레드** : 자바스크립트는 싱글스레드 방식으로 프로그램을 순차적으로(위에서 아래로 차례차례) 실행한다. 실행 문맥 하나의 작업이 끝나면 pop을 하고 바로 아래에 있는 실행 문맥을 실행함.
- 반면 **멀티스레드**는 동시에 작업을 여러 개 병렬로 실행한다.

---

### "use strict";

- **버그 자체가 발생하기 어려운 환경 조성하는 게 중요**
- strict 모드로 자바스크립트 프로그램을 실행하면 자바스크립트 엔진이 내부적으로 최적화 처리에 장애가 되는 부분을 제거함.
  - 변수는 모두 선언해야만 한다.

---

### 프로그램이 의도한 대로 동작하는지 확인하고, 문제의 원인을 추적합니다.

#### - console 디버깅 :

- **console.log**로 변수 값 표시하기
- **console.dir**로 객체의 프로퍼티 목록을 표시하기

---

### 에러(예외)를 처리해봅시다.

- 발생한 예외를 던져서 알려주고, 예외를 받아서 처리합니다.
- throw ~ error
- Error 처리

  ##### try catch로 에러가 날 만한 코드 감싸주기.

```js
try {
  //에러가 나는 코드
} catch (e) {
  console.error(e); //에러가 났을 때 복구할 방법
}

// 여기서 e는 에러
```

---

### Error객체

예외를 표현하기 위한 내장 객체

```js
    ReferenceError: a is not defined at <anonymous>:2:2
    message: "a is not defined"
    stack: "ReferenceError: a is not defined at <anonymous>:2:2"
    __proto__: Error
```

---

### throw문

- 예외를 던짐

```js
  function permutation(a){
    if ( !(a instance of Array) ){
      throw new Error(a + " is not an array");
    }
  }

  permutation("ABC");

  Error : ABC is not an array
```

---

### try/catch/finally 문

```js
try {
  // 에러가 나는 코드
} catch (e) {
  // try 블록에서 예외가 발생했을 때 실햄됨.
} finally {
  //  try 블록 코드와 catch 블록 코드가 실행된 이후에 반드시 실행됨
}
```

---

### 예외의 전파

- 호출 스택을 거슬러 올라가면서 전파됨.

```js
  try {
    f();
  } catch(e) {
    console.log("예외를 캐치함 -> " + e);
  }

  function f() { g(); }
  function g() { h(); }
  function h() { throw new Error("오류가 발생했습니다"); }

  예외를 캐치함 -> Error: 오류가 발생했습니다
```

---

### 비동기 처리의 콜백 함수가 던진 예외

- 함수를 콜하는 시점과 실행시점이 달라서 예외를 잡을 수 없음
- 그래서 비동기 처리 중에 발생한 에러를 잡기 위해서는 제너레이터가 필요함.

```js
  try {
    setTimeout(function throwError() {
      throw new Error("오류가 발생했습니다");
    }, 1000);
  } catch(e) {
    console.log("예외를 캐치함 -> " + e);
  }

  //제너레이터 활용해서 비동기 처리 중에 발생한 에외도 잡아서 처리하기

  function sleepAndError(g,n) {
    setTimeout(function () {
      for(var i = 0; i<n; i++) console.log(i);
      g.throw(new Error("오류가 발생했습니다"));
    }, 1000);
  }

  function run(callback, ...argsList) {
    var g = ( function\* (cb,args) {
    try {
      yield cb(g, ...args);
    } catch(e) {
      console.log("예외를 잡음 -> " + e);
    }
  })(callback, argsList);
    g.next();
  }

  run(sleepAndError,10);
```
