---
title: "백준 1065번 | 한수"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 한수 🔥

### 문제

어떤 양의 정수 X의 각 자리가 등차수열을 이룬다면, 그 수를 한수라고 한다. 등차수열은 연속된 두 개의 수의 차이가 일정한 수열을 말한다. N이 주어졌을 때, 1보다 크거나 같고, N보다 작거나 같은 한수의 개수를 출력하는 프로그램을 작성하시오.

### 입력

첫째 줄에 1,000보다 작거나 같은 자연수 N이 주어진다.

### 출력

첫째 줄에 1보다 크거나 같고, N보다 작거나 같은 한수의 개수를 출력한다.

## 어떻게 풀었는가

- 아직 각 수의 공차를 구하는 방법을 고민중이다!

```js
let fs = require("fs");
let input = fs
  .readFileSync("example.txt")
  .toString()
  .trim();

let num = [];
for (let i = 1; i <= input; i++) {
  num.push(i);
}

let count = 0;
for (let i = 0; i <= input - 1; i++) {
  if (num[i] < 100) {
    count++;
  } else {
    let temp = String(num[i]).split("");

    diff = temp[1] - temp[0];

    // 3
    for (let j = 1; j < temp.length; j++) {}
  }
}
```

## WILT : What I Learned Today 🤔

---

## 참고

[1065번: 한수](https://www.acmicpc.net/problem/1065)
