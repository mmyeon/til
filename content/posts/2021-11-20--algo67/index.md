---
title: "백준 2562번 | 최댓값"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 최댓값 🔥

### 문제

9개의 서로 다른 자연수가 주어질 때, 이들 중 최댓값을 찾고 그 최댓값이 몇 번째 수인지를 구하는 프로그램을 작성하시오.

예를 들어, 서로 다른 9개의 자연수
3, 29, 38, 12, 57, 74, 40, 85, 61이 주어지면, 이들 중 최댓값은 85이고, 이 값은 8번째 수이다.

### 입력

첫째 줄부터 아홉 번째 줄까지 한 줄에 하나의 자연수가 주어진다. 주어지는 자연수는 100 보다 작다.

### 출력

첫째 줄에 최댓값을 출력하고, 둘째 줄에 최댓값이 몇 번째 수인지를 출력한다.

## 코드

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("\n");

let numArr = input.map(x => Number(x));

let maxNum = numArr[0];
let maxOrder = 1;

for (let i = 1; i < numArr.length; i++) {
  if (maxNum < numArr[i]) {
    maxNum = numArr[i];
    maxOrder = i + 1;
  }
}

console.log(`${maxNum}
${maxOrder}`);
```

## WILT : What I Learned Today 🤔

- 초반에 인덱스와 몇 번째 위치한 숫자인지를 착각해서 문제를 풀었다. 요구사항 다시 한번 확인하고 문제 풀이 시작하자.
- 오늘 새롭게 느낀 점은 이전에는 문제를 보면 어떻게 풀지라는 생각이 들면서 많이 막막했다. 그러나 11월 3일 이후로 매일 한 문제씩 풀다보니 이제는 어떤 방식으로 풀까, 어떤 게 더 좋은 방법일까 라는 질문을 먼저 하게 된다. 부담감이 많이 줄었고 풀다 막히면 찾으면 된다는 자신감도 생겨서 정말 기쁘다.

---

## 참고

[2562번: 최댓값](https://www.acmicpc.net/problem/2562)
