---
title: "백준 10818번 | 최소, 최대"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 최소, 최대 🔥

### 문제

N개의 정수가 주어진다. 이때, 최솟값과 최댓값을 구하는 프로그램을 작성하시오.

### 입력

첫째 줄에 정수의 개수 N (1 ≤ N ≤ 1,000,000)이 주어진다. 둘째 줄에는 N개의 정수를 공백으로 구분해서 주어진다. 모든 정수는 -1,000,000보다 크거나 같고, 1,000,000보다 작거나 같은 정수이다.

### 출력

첫째 줄에 주어진 정수 N개의 최솟값과 최댓값을 공백으로 구분해 출력한다.

## 코드

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("\n");

let length = Number(input[0]);
let numArr = input[1].split(" ").map(x => Number(x));

function compareNums(a, b) {
  return a - b;
}

numArr.sort(compareNums);
console.log(numArr[0], numArr[length - 1]);
```

## WILT : What I Learned Today 🤔

- 배열의 정렬을 이용해서 쉽게 문제를 풀 수 있었다.
- 예전에도 숫자가 담긴 배열을 정렬하는 함수가 내부적으로 어떻게 동작했는지 궁금했는데 오늘에서야 완전히 이해할 수 있었다.

---

## 참고

[10818번: 최소, 최대](https://www.acmicpc.net/problem/10818)
