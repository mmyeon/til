---
title: "백준 1110번 | 더하기 사이클"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 더하기 사이클 🔥

### 문제

0보다 크거나 같고, 99보다 작거나 같은 정수가 주어질 때 다음과 같은 연산을 할 수 있다. 먼저 주어진 수가 10보다 작다면 앞에 0을 붙여 두 자리 수로 만들고, 각 자리의 숫자를 더한다. 그 다음, 주어진 수의 가장 오른쪽 자리 수와 앞에서 구한 합의 가장 오른쪽 자리 수를 이어 붙이면 새로운 수를 만들 수 있다. 다음 예를 보자.

26부터 시작한다. 2+6 = 8이다. 새로운 수는 68이다. 6+8 = 14이다. 새로운 수는 84이다. 8+4 = 12이다. 새로운 수는 42이다. 4+2 = 6이다. 새로운 수는 26이다. 위의 예는 4번만에 원래 수로 돌아올 수 있다. 따라서 26의 사이클의 길이는 4이다.

N이 주어졌을 때, N의 사이클의 길이를 구하는 프로그램을 작성하시오.

### 입력

첫째 줄에 N이 주어진다. N은 0보다 크거나 같고, 99보다 작거나 같은 정수이다.

### 출력

첫째 줄에 N의 사이클 길이를 출력한다.

### 처리해야 할 부분

10보다 작은 수가 입력되면 0을 인풋값숫자 앞에 붙인다. <br>
두 숫자의 합이 0이면 1을 리턴한다.

## 코드

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("");
let target = Number(input.join(""));

if (input.length === 1) {
  input.unshift(0);
}

if (target === 0) {
  return console.log(1);
}

let nextNum = 0;
let sum = 0;
let newArr = [...input];
let count = 0;

while (target !== nextNum) {
  sum = Number(newArr[0]) + Number(newArr[1]);
  newArr.shift();

  if (sum < 10) {
    newArr.push(sum);
  } else {
    newArr.push(String(sum).split("")[1]);
  }

  nextNum = Number(newArr.join(""));
  count++;
}

console.log(count);
```

## WILT : What I Learned Today 🤔

- 처음에는 문제가 어렵게 느껴졌는데 천천히 스텝 바이 스텝으로 해서 해결할 수 있었다. 어렵다고 느껴지는 문제면 작게 쪼개서 하나하나 조건 만족해나가면 된다. 아자아자!

---

## 참고

[1110번: 더하기 사이클](https://www.acmicpc.net/problem/1110)
