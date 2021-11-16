---
title: "백준 10952번 | A+B - 5"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 A+B - 5 🔥

### 문제

두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.

### 입력

입력은 여러 개의 테스트 케이스로 이루어져 있다.
각 테스트 케이스는 한 줄로 이루어져 있으며, 각 줄에 A와 B가 주어진다. (0 < A, B < 10)
입력의 마지막에는 0 두 개가 들어온다.

### 출력

각 테스트 케이스마다 A+B를 출력한다.

## 코드

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .split("\n");
let newArr = input.map(item => item.split(" "));
let i = 0;

while (i < newArr.length) {
  let numArr = newArr[i].map(n => Number(n));

  let firstInput = numArr[0];
  let lastInput = numArr[1];

  if ((firstInput === 0) & (lastInput === 0)) {
    break;
  } else {
    console.log(firstInput + lastInput);
  }

  i++;
}
```

## WILT : What I Learned Today 🤔

- `split()`메서드 오타때문에 계속 통과를 못했는데 그것도 모르고 계속 코드 다른 부분만 수정했다. 코드가 원하는 대로 작동하지 않으면 내가 해석기가 되었다고 생각하고 코드를 위에서부터 쭉 읽어봐야겠다. 원인 파악하지 않고 수정하는 습관이 아직도 남아있다. 에러 원인 파악하고 그 다음에 스스로 설명할 수 있을 때 코드를 수정하자!

---

## 참고

[10952번 - A+B - 5](https://www.acmicpc.net/problem/10952)
