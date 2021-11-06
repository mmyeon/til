---
title: "백준 2588번 | 곱셈"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 곱셈 🔥

### 문제

> (세 자리 수) × (세 자리 수)는 다음과 같은 과정을 통하여 이루어진다.

> (1)과 (2)위치에 들어갈 세 자리 자연수가 주어질 때 (3), (4), (5), (6)위치에 들어갈 값을 구하는 프로그램을 작성하시오.

## 코드

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .split("\n");
let num1 = parseInt(input[0]);
let num2 = parseInt(input[1]);

let oneNum = num2 % 10;
let tenNum = Math.floor((num2 % 100) / 10);
let hundredNum = Math.floor(num2 / 100);

console.log(num1 * oneNum);
console.log(num1 * tenNum);
console.log(num1 * hundredNum);
console.log(num1 * num2);
```

---

## WILT : What I Learned Today 🤔

- 입력값이 여러줄인 경우에는 줄바꿈을 기준으로 문자를 split해야 한다.

```jsx
let a = `123\n456`;

a.split("");
// [123\n456]
a.split("\n");
// [123,456]
```

- 문제를 풀다 오류가 나면 왜 안되지에서 한 걸음 나아가서 <b>'잘은 모르지만 이 부분이 문제인 것 같다'</b>는 가정을 세워보자. 코드를 좀 더 쳐다보는 연습을 반복하자!

---

## 참고

[2588번: 곱셈](https://www.acmicpc.net/problem/2588)
