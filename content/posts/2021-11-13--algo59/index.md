---
title: "백준 11021번 | A+B - 7"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 A+B - 7 🔥

### 입력

첫째 줄에 테스트 케이스의 개수 T가 주어진다.<br/>
각 테스트 케이스는 한 줄로 이루어져 있으며, 각 줄에 A와 B가 주어진다. (0 < A, B < 10)

### 출력

각 테스트 케이스마다 "Case #x: "를 출력한 다음, A+B를 출력한다. 테스트 케이스 번호는 1부터 시작한다.

## 코드

```js
let fs = require("fs");

let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .split("\n");

let output = "";

for (let i = 1; i <= input[0]; i++) {
  let numArr = input[i].split(" ");
  let sum = Number(numArr[0]) + Number(numArr[1]);

  if (i < input[0]) {
    output += `Case #${i}: ${sum} \n`;
  } else {
    output += `Case #${i}: ${sum}`;
  }
}

console.log(output);
```

---

## 참고

[11021번 - A+B - 7](https://www.acmicpc.net/problem/11021)
