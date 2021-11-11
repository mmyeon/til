---
title: "백준 15552번 | 빠른 A+B"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 빠른 A+B 🔥

### 입력

첫 줄에 테스트케이스의 개수 T가 주어진다. T는 최대 1,000,000이다. 다음 T줄에는 각각 두 정수 A와 B가 주어진다. A와 B는 1 이상, 1,000 이하이다.

### 출력

각 테스트케이스마다 A+B를 한 줄에 하나씩 순서대로 출력한다.

### 참고

본격적으로 for문 문제를 풀기 전에 주의해야 할 점이 있다. 입출력 방식이 느리면 여러 줄을 입력받거나 출력할 때 시간초과가 날 수 있다는 점이다.

## 코드

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .split("\n");

let count = input[0];

let output = "";
for (let i = 1; i <= count; i++) {
  let numArr = input[i].split(" ");
  output += Number(numArr[0]) + Number(numArr[1]) + "\n";
}
console.log(output);
```

---

## WILT : What I Learned Today 🤔

- vscode에서 node.js 테스트하는 방법을 배워서 코드 작성하기가 훨씬 더 수월해졌다.
- for문 안에서 `console.log`를 반복해서 사용하면 시간초과가 발생한다. 따라서 여러번 결과를 출력해야 하는 경우에는 매번 `console.log`를 호출하지 말고 문자열로 합친 후 한 번만 호출하는 게 더 빠른 방법이라는 걸 배웠다.

---

## 참고

[15552번: 빠른 A+B](https://www.acmicpc.net/problem/15552)

[백준에서 node.js 입출력 방법 정리(백준/자바스크립트/코딩테스트/알고리즘)](https://nyang-in.tistory.com/156)

[Node.js 알고리즘 풀때 주의 사항](https://hanch-dev.tistory.com/4)
