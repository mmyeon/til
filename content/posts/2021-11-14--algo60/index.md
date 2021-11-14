---
title: "백준 2438번 | 별 찍기 - 1"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 별 찍기 - 1 🔥

### 입력

첫째 줄에 N(1 ≤ N ≤ 100)이 주어진다.

### 출력

첫째 줄부터 N번째 줄까지 차례대로 별을 출력한다.

## 코드

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .split(" ");

let num = Number(input);
let star = "*";
let output = "";

for (let i = 0; i <= num - 1; i++) {
  output = "";

  for (let j = 0; j <= i; j++) {
    output += star;
  }
  console.log(output);
}
```

---

## 참고

[2438번 - 별 찍기 - 1](https://www.acmicpc.net/problem/2438)
