---
title: var / const / let
tags: ["JS"]
cover: javascript.jpg
author: mmyeon
---

### var

- **함수 스코프**
- 어디서든 변수에 접근 가능
- 전역 스코프에서 선언 시 window나 global에 등록됨.
- **값 변경 가능 (초기화 가능)**

```js
var x = 1;
if (x === 1) {
  var x = 2;

  console.log(x);
  // expected output : 2
}

console.log(x);
// expected output : 2
```

---

### const

- **블록 스코프**
- 해당 변수를 해당 블록에서만 접근할 수 있음.
- 블록 바깥에서는 변수에 접근할 수 없음.
- 변수를 선언한 곳보다 위에서 변수에 접근하면 에러가 발생함.
- 전역 스코프에서 선언 시 window나 global에 등록되지 않음.
- 한 번 초기화하면 다른 값 대입 안됨.
- **재할당 안됨**. 대신 할당된 객체나 배열의 요소가 바뀌는 건 가능(즉 데이터의 주소값만 고정됨.)
- **재선언 안됨**

```js
const number = 42;

try {
  number = 99;
} catch (err) {
  console.log(err);
}

console.log(number);

//TypeError : Assignment to constant variables.
//42
```

---

### let

- **블록 스코프**
- 해당 변수를 해당 블록에서만 접근할 수 있음
- 블록 바깥에서는 변수에 접근할 수 없음
- 변수를 선언한 곳보다 위에서 변수에 접근하면 에러가 발생함
- 전역 스코프에서 선언 시 window나 global에 등록되지 않음
- **기존의 var처럼 계속 값을 바꿔줄 수 있다 (초기화 가능)**.

```js
let x = 1;

if (x === 1) {
  let x = 2;

  console.log(x);
  // expected output : 2
}

console.log(x);
// expected output : 1
```

---

### 참고

[(ECMAScript) ES2015(ES6) Const, Let](https://www.zerocho.com/category/ECMAScript/post/5757d74345041aaae7493479)
