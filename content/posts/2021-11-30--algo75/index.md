---
title: "백준 11720번 | 숫자의 합"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 숫자의 합 🔥

### 문제

N개의 숫자가 공백 없이 쓰여있다. 이 숫자를 모두 합해서 출력하는 프로그램을 작성하시오.

### 입력

첫째 줄에 숫자의 개수 N (1 ≤ N ≤ 100)이 주어진다. 둘째 줄에 숫자 N개가 공백없이 주어진다.

### 출력

입력으로 주어진 숫자 N개의 합을 출력한다.

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("\n");

let nums = input[1].split("").map(x => Number(x));

let result = nums.reduce((a, b) => a + b);

console.log(result);
```

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("\n");

let length = Number(input[0]);
let nums = input[1].split("").map(x => Number(x));

let sum = 0;
for (let i = 0; i < length; i++) {
  sum += nums[i];
}

console.log(sum);
```

---

## 참고

[11720번: 숫자의 합](https://www.acmicpc.net/problem/11720)
