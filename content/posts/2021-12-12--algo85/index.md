---
title: "백준 2292번 | 벌집"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 벌집 🔥

### 문제

육각형으로 이루어진 벌집이 있다. 그림에서 보는 바와 같이 중앙의 방 1부터 시작해서 이웃하는 방에 돌아가면서 1씩 증가하는 번호를 주소로 매길 수 있다. 숫자 N이 주어졌을 때, 벌집의 중앙 1에서 N번 방까지 최소 개수의 방을 지나서 갈 때 몇 개의 방을 지나가는지(시작과 끝을 포함하여)를 계산하는 프로그램을 작성하시오. 예를 들면, 13까지는 3개, 58까지는 5개를 지난다.

### 입력

첫째 줄에 N(1 ≤ N ≤ 1,000,000,000)이 주어진다.

### 출력

입력으로 주어진 방까지 최소 개수의 방을 지나서 갈 때 몇 개의 방을 지나는지 출력한다.

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim();

let target = Number(input);
let result = 1;
let startNum = 1;
let endNum = startNum;
let increment = 0;

for (let i = 1; i < target; i++) {
  increment = 6 * i;
  endNum += increment;

  if (target <= endNum) {
    result = startNum + i;
    break;
  }
}

console.log(result);
```

## WILT : What I Learned Today 🤔

- 코드에서 오류가 나면 스스로 엔진이 되어서 코드 한 줄 한 줄 읽어보자. 내 코드가 원하는 대로 작동하지 않는 이유는 코드 안에 있다.
- 오류를 발생하게 하는 코드의 범위를 점점 좁혀나가자. 문제 해결까지는 아니어도 적어도 어디서 문제가 발생하는 지 발견할 수 있는 사람이 되자.

---

## 참고

[2292번: 벌집](https://www.acmicpc.net/problem/2292)
