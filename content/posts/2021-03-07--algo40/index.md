---
title: "문제40 : 놀이동산에 가자"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 제한 몸무게를 고려해서 몇 명이 탈 수 있는지 구하기 🔥

### 입력 받는 순서 : 제한 몸무게 > 사람수 > 차례대로 탑승할 사람들의 몸무게<br>

### 몸무게는 무작위로 주어짐

> 입력 :</br>
> 50</br>
> 5</br>
> 20</br>
> 20</br>
> 20</br>
> 20</br>
> 20</br>

> 출력 : 2</br>

## 나의 접근법

- 입력받은 개인의 몸무게를 weightList에 추가하기
- 탑승 가능 몸무게 변수 만들기
- 몸무게 배열 요소와 제한 몸무게를 비교하기
  - 제한 몸무게보다 작으면 탑승 가능 몸무게 변수에 추가
  - 제한 몸무게는 그 만큼 감소시킴
- 탑승 가능 몸무게 변수의 길이 리턴함

```js
const weightLimit = prompt("제한 몸무게를 입력하시오");
const peopleNum = prompt("인원수를 입력하시오");
const individualWeight = 40;
const weightList = [];
const allowedWeightList = [];

for (let i = 0; i < peopleNum; i++) {
  weightList.push(individualWeight);
}

for (let i = 0; i < weightList.length; i++) {
  if (weightList[i] < weightLimit) {
    allowedWeightList.push(weightList[i]);
    weightLimit = weightLimit - weightList[i];
  }
}

const allowedPersonNum = allowedWeightList.length;
console.log("allowedPersonNum", allowedPersonNum);
```

## 또 다른 접근법

```js
let total = 0;
let count = 0;
const limit = prompt("제한 몸무게를 입력하세요.");
const n = prompt("인원수를 입력하세요.");

for (let i = 1; i <= n; i++) {
  total += parseInt(prompt("무게를 입력해주세요"), 10);
  if (total <= limit) {
    count = i;
  }
}

console.log(count);
```

---

## WILT : What I Learned Today 🤔

- 원하는 값이 나오길래 문자열로 입력받은 값을 숫자로 변환하지 않고 그대로 진행했다. 그런데 데이터 타입을 고려하면서 코드를 짜는 게 더 좋은 습관이라는 생각이 들었다. 강제변환 고려하지 말고 데이터타입 더 명확하게 관리해야겠다.
- 프로그램속에서 꼭 필요한 정보(**몸무게의 합계, 탈 수 있는 사람의 숫자**)를 고려해서 코드를 더 쉽고 간단하게 짜는 연습을 해야겠다
