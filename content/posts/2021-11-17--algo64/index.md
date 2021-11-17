---
title: "백준 10951번 | A+B - 4"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 A+B - 4 🔥

### 문제

두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.

### 입력

입력은 여러 개의 테스트 케이스로 이루어져 있다.
각 테스트 케이스는 한 줄로 이루어져 있으며, 각 줄에 A와 B가 주어진다. (0 < A, B < 10)

### 출력

각 테스트 케이스마다 A+B를 출력한다.

## 코드

```js
let fs = require("fs");

let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("\n");

let i = 0;

while (i < input.length) {
  let numArr = input[i].split(" ").map(x => Number(x));
  console.log(numArr[0] + numArr[1]);
  i++;
}
```

## WILT : What I Learned Today 🤔

- 문자열 양 끝의 공백을 제거하는 메서드인 `trim()`메서드에 대해 배웠다.

---

## 참고

[10951번 - A+B - 4](https://www.acmicpc.net/problem/10951)
