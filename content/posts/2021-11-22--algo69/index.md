---
title: "백준 3052번 | 나머지"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 나머지 🔥

### 문제

두 자연수 A와 B가 있을 때, A%B는 A를 B로 나눈 나머지 이다. 예를 들어, 7, 14, 27, 38을 3으로 나눈 나머지는 1, 2, 0, 2이다.

수 10개를 입력받은 뒤, 이를 42로 나눈 나머지를 구한다. 그 다음 서로 다른 값이 몇 개 있는지 출력하는 프로그램을 작성하시오.

### 입력

첫째 줄부터 열번째 줄 까지 숫자가 한 줄에 하나씩 주어진다. 이 숫자는 1,000보다 작거나 같고, 음이 아닌 정수이다.

### 출력

첫째 줄에, 42로 나누었을 때, 서로 다른 나머지가 몇 개 있는지 출력한다.

## 코드

> for문, includes() 메서드 사용

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("\n");

let numArr = input.map(x => Number(x));
let targetNum = 42;
let result = [];
let remain = 0;

for (let i = 0; i < numArr.length; i++) {
  remain = numArr[i] % targetNum;
  if (!result.includes(remain)) {
    result.push(remain);
  }
}

console.log(result.length);
```

> forEach, includes() 메서드 사용

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("\n");

let numArr = input.map(x => Number(x));
let targetNum = 42;
let result = [];
let remain = 0;

numArr.forEach(element => {
  remain = element % targetNum;
  if (!result.includes(remain)) {
    result.push(remain);
  }
});

console.log(result.length);
```

> new Set() 사용

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("\n");
let numArr = input.map(x => Number(x));
let targetNum = 42;
let result = [];
let remain = 0;

numArr.forEach(element => {
  remain = element % targetNum;
  result.push(remain);
});

const set = new Set(result);

console.log([...set].length);
```

## WILT : What I Learned Today 🤔

- 중복을 다루는 방법에 대해서 배웠다. 현재의 값이 이미 존재하는지 확인한 뒤, 없는 경우에는 값을 추가하는 방법을 사용했더니 아주 쉽게 해결할 수 있었다.

---

## 참고

[3052번: 나머지](https://www.acmicpc.net/problem/3052)
