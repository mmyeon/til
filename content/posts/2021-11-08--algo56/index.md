---
title: "백준 2884번 | 알람 시계"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 곱셈 🔥

### 입력

첫째 줄에 두 정수 H와 M이 주어진다. (0 ≤ H ≤ 23, 0 ≤ M ≤ 59) 그리고 이것은 현재 상근이가 설정한 놓은 알람 시간 H시 M분을 의미한다.

입력 시간은 24시간 표현을 사용한다. 24시간 표현에서 하루의 시작은 0:0(자정)이고, 끝은 23:59(다음날 자정 1분 전)이다. 시간을 나타낼 때, 불필요한 0은 사용하지 않는다.

### 출력

첫째 줄에 상근이가 창영이의 방법을 사용할 때, 설정해야 하는 알람 시간을 출력한다. (입력과 같은 형태로 출력하면 된다.)

### 예제

> 입력 10 10
> 출력 9 25

> 입력 0 30
> 출력 23 45

## 코드

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .split(" ");
let hour = parseInt(input[0]);
let minute = parseInt(input[1]);

if (minute >= 45) {
  console.log(`${hour} ${minute - 45}`);
} else {
  const newHour = hour - 1 < 0 ? 23 : hour - 1;
  console.log(`${newHour} ${minute - 45 + 60}`);
}
```

---

## WILT : What I Learned Today 🤔

- 이번 문제를 풀때 조건을 자세히 살피지 않아서 불필요한 코드들이 많이 추가되었다. 어떤 조건에서 어떤 동작이 필요한지를 이해하고 나니 코드가 훨씬 더 깔끔해졌다. 다음에는 문제를 풀 때 조건을 꼼꼼히 파악하고 시작해야겠다.

---

## 참고

[2588번: 곱셈](https://www.acmicpc.net/problem/2588)
