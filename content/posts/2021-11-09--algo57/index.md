---
title: "백준 10950번 | A+B - 3"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 A+B - 3 🔥

### 문제

두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.

### 입력

첫째 줄에 테스트 케이스의 개수 T가 주어진다.
각 테스트 케이스는 한 줄로 이루어져 있으며, 각 줄에 A와 B가 주어진다. (0 < A, B < 10)

### 출력

각 테스트 케이스마다 A+B를 출력한다.

## 코드

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .split("\n");

for (let i = 1; i <= input[0]; i++) {
  let numArr = input[i].split(" ");
  console.log(parseInt(numArr[0]) + parseInt(numArr[1]));
}
```

---

## WILT : What I Learned Today 🤔

- 노트에 조건 적고 문제 풀기 시작하니까 좀 더 수월했다.
- 매일 조금씩 나아지고 있다는 느낌이 들어서 기쁘다!!

---

## 참고

[10950번 - A+B - 3](https://www.acmicpc.net/problem/10950)
