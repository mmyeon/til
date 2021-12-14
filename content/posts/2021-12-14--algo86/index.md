---
title: "백준 2292번 | 분수찾기"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 분수찾기 🔥

### 문제

무한히 큰 배열에 다음과 같이 분수들이 적혀있다.

1/1 1/2 1/3 1/4 1/5 …
2/1 2/2 2/3 2/4 … …
3/1 3/2 3/3 … … …
4/1 4/2 … … … …
5/1 … … … … …
… … … … … …
이와 같이 나열된 분수들을 1/1 → 1/2 → 2/1 → 3/1 → 2/2 → … 과 같은 지그재그 순서로 차례대로 1번, 2번, 3번, 4번, 5번, … 분수라고 하자.

X가 주어졌을 때, X번째 분수를 구하는 프로그램을 작성하시오.

### 입력

첫째 줄에 X(1 ≤ X ≤ 10,000,000)가 주어진다.

### 출력

첫째 줄에 분수를 출력한다.

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim();

let num = Number(input);
//  몇 번째 행인가
let index = 0;

while (true) {
  index++;
  sum = (index * (index + 1)) / 2;

  // 4번째 줄에 숫자가 있음
  if (num <= sum) {
    // 4번째 행이다
    break;
  }
}

// 해당 행에서 몇 번째냐
let order = num - ((index - 1) * index) / 2;

if (index % 2 === 0) {
  console.log(`${order} / ${index - order + 1}`);
} else {
  console.log(`${index - order + 1} / ${order}`);
}
```

## WILT : What I Learned Today 🤔

---

## 참고

[1193번: 분수찾기](https://www.acmicpc.net/problem/1193)
