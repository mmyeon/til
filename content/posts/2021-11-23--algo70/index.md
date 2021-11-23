---
title: "백준 1546번 | 평균"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 평균 🔥

### 문제

세준이는 기말고사를 망쳤다. 세준이는 점수를 조작해서 집에 가져가기로 했다. 일단 세준이는 자기 점수 중에 최댓값을 골랐다. 이 값을 M이라고 한다. 그리고 나서 모든 점수를 점수/M\*100으로 고쳤다.

예를 들어, 세준이의 최고점이 70이고, 수학점수가 50이었으면 수학점수는 50/70\*100이 되어 71.43점이 된다.
세준이의 성적을 위의 방법대로 새로 계산했을 때, 새로운 평균을 구하는 프로그램을 작성하시오.

### 입력

첫째 줄에 시험 본 과목의 개수 N이 주어진다. 이 값은 1000보다 작거나 같다. 둘째 줄에 세준이의 현재 성적이 주어진다. 이 값은 100보다 작거나 같은 음이 아닌 정수이고, 적어도 하나의 값은 0보다 크다.

### 출력

첫째 줄에 새로운 평균을 출력한다. 실제 정답과 출력값의 절대오차 또는 상대오차가 10-2 이하이면 정답이다.

## 코드

- `Math.max()`메서드로 최대값 구하기
- `reduce()` 메서드로 점수의 합 구하기
- 결과값이 정수면 소수점 1 자리까지 표현하기

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("\n");

let scoreLength = Number(input[0]);
let scores = input[1].split(" ").map(x => Number(x));
let maxScore = Math.max(...scores);
let manipulatedScores = scores.map(score => (score / maxScore) * 100);

const add = (a, b) => a + b;
let totalScore = manipulatedScores.reduce(add);
let result = totalScore / scoreLength;

if (Number.isInteger(result)) {
  console.log(result.toFixed(1));
} else {
  console.log(result);
}
```

## WILT : What I Learned Today 🤔

- 마지막에 리턴값을 표현하는 규칙을 찾는데 시간이 조금 걸렸다. 규칙만 찾으면 해결방법이 쉽다는 걸 발견한 문제였다!

---

## 참고

[1546번: 평균](https://www.acmicpc.net/problem/1546)
