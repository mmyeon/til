---
title: "백준 4344번 | 평균은 넘겠지"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 평균은 넘겠지 🔥

### 문제

대학생 새내기들의 90%는 자신이 반에서 평균은 넘는다고 생각한다. 당신은 그들에게 슬픈 진실을 알려줘야 한다.

### 입력

첫째 줄에는 테스트 케이스의 개수 C가 주어진다.

둘째 줄부터 각 테스트 케이스마다 학생의 수 N(1 ≤ N ≤ 1000, N은 정수)이 첫 수로 주어지고, 이어서 N명의 점수가 주어진다. 점수는 0보다 크거나 같고, 100보다 작거나 같은 정수이다.

### 출력

각 케이스마다 한 줄씩 평균을 넘는 학생들의 비율을 반올림하여 소수점 셋째 자리까지 출력한다.

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("\n");

let number = Number(input[0]);

for (let i = 1; i <= number; i++) {
  let newArr = input[i].split(" ").map(x => Number(x));
  let numberOfScores = newArr[0];
  let scores = newArr.splice(1);
  let sum = 0;
  let averageScore = 0;
  let countAboveAverage = 0;
  let ratio = 0;

  for (let j = 0; j < numberOfScores; j++) {
    sum += scores[j];
  }

  averageScore = sum / numberOfScores;
  countAboveAverage = scores.filter(num => num > averageScore).length;
  ratio = (countAboveAverage / numberOfScores) * 100;
  console.log(`${ratio.toFixed(3)}%`);
}
```

## WILT : What I Learned Today 🤔

- 문제를 꼼꼼히 파악한 후 접근 방법을 단계별로 쪼개서 적어놓았더니 중간에 막혀도 내가 무엇을 해야하는지가 명확해서 몰입해서 해결할 수 있었다.

---

## 참고

[4344번: 평균은 넘겠지](https://www.acmicpc.net/problem/4344)
