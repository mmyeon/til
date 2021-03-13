---
title: "문제45 : 재귀함수(3)"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 각 자릿수의 합 구하기 🔥

### 1. 반복문

```js
const input = "123123";
let i = 0;
let sum = 0;

while (i < input.length) {
  sum += parseInt(input[i], 10);
  i++;
}

console.log("sum", sum); // 12
```

### 2. 재귀함수

```js
function sum(x) {
  if (x.length === 1) {
    return parseInt(x, 10);
  }
  return parseInt(x[x.length - 1], 10) + sum(x.slice(0, x.length - 1));
}

console.log("sum", sum("1231233")); // 12
```

---

## WILT : What I Learned Today 🤔

- 재귀 다음 호출에서 인자로 무엇을 넘겨야 하는지 한참 고민했다. 다음 강의 내용인 피보나치 수열을 통해 다시 연습해보자!
