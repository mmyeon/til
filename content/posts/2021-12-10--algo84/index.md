---
title: "백준 1712번 | 손익분기점"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 손익분기점 🔥

### 문제

월드전자는 노트북을 제조하고 판매하는 회사이다. 노트북 판매 대수에 상관없이 매년 임대료, 재산세, 보험료, 급여 등 A만원의 고정 비용이 들며, 한 대의 노트북을 생산하는 데에는 재료비와 인건비 등 총 B만원의 가변 비용이 든다고 한다.

예를 들어 A=1,000, B=70이라고 하자. 이 경우 노트북을 한 대 생산하는 데는 총 1,070만원이 들며, 열 대 생산하는 데는 총 1,700만원이 든다.

노트북 가격이 C만원으로 책정되었다고 한다. 일반적으로 생산 대수를 늘려 가다 보면 어느 순간 총 수입(판매비용)이 총 비용(=고정비용+가변비용)보다 많아지게 된다. 최초로 총 수입이 총 비용보다 많아져 이익이 발생하는 지점을 손익분기점(BREAK-EVEN POINT)이라고 한다.

A, B, C가 주어졌을 때, 손익분기점을 구하는 프로그램을 작성하시오.

### 입력

첫째 줄에 A, B, C가 빈 칸을 사이에 두고 순서대로 주어진다. A, B, C는 21억 이하의 자연수이다.

### 출력

첫 번째 줄에 손익분기점 즉 최초로 이익이 발생하는 판매량을 출력한다. 손익분기점이 존재하지 않으면 -1을 출력한다.

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split(" ");
let fixedCost = Number(input[0]);
let productionCost = Number(input[1]);
let sellingCost = Number(input[2]);
let breakPoint = 0;

if (sellingCost > productionCost) {
  breakPoint = Math.floor(fixedCost / (sellingCost - productionCost)) + 1;
} else {
  breakPoint = -1;
}

console.log(breakPoint);
```

## WILT : What I Learned Today 🤔

- 웰컴 투 삽질..!
- 런타임에러를 만나서 `while문`을 콘솔 찍어보니 무한루프가!! 예시 두 개에만 일부 적용되는 규칙을 사용해서 발생한 문제였다.
- 문제를 관통하는 어떤 규칙이 존재할지도 모르니 모든 예시에 적용될 수 있는 규칙이 있는지 꼼꼼히 찾는 습관을 길러야 겠다.
- 그리고 사칙연산을 할 때 과연 이 수가 정확하게 떨어질까 하는 부분에 대한 고민이 필요하다는 걸 배웠다.
- 아직도 생각이 끝나기 전에 코드를 고치는 습관이 남아있다. 좀 더 의식적으로 연습해야겠다. 생각 정리 -> 방향 설정 -> 코드 개선!

---

## 참고

[1712번: 손익분기점](https://www.acmicpc.net/problem/1712)
