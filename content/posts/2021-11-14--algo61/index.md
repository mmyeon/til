---
title: "백준 2439번 | 별 찍기 - 2"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 별 찍기 - 2 🔥

### 문제

첫째 줄에는 별 1개, 둘째 줄에는 별 2개, N번째 줄에는 별 N개를 찍는 문제
하지만, 오른쪽을 기준으로 정렬한 별(예제 참고)을 출력하시오.

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
let output = "";

for (let i = num; i > 0; i--) {
  output = "";
  for (let j = 1; j <= num; j++) {
    if (i <= j) {
      output += "*";
    } else {
      output += " ";
    }
  }
  console.log(output);
}
```

## WILT : What I Learned Today 🤔

- 처음에는 "이러면 될 것 같은데"로 바로 코드 작성했더니 실패했다. 그래서 다시 노트에 차근차근 단계별로 접근해서 문제를 해결할 수 있었다. 노트에 적으면서 문제를 푸니 훨씬 더 가독성이 좋은 코드를 작성할 수 있었다.

---

## 참고

[2439번 - 별 찍기 - 2](https://www.acmicpc.net/problem/2439)
