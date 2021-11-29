---
title: "백준 1065번 | 한수"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 한수 🔥

### 문제

어떤 양의 정수 X의 각 자리가 등차수열을 이룬다면, 그 수를 한수라고 한다. 등차수열은 연속된 두 개의 수의 차이가 일정한 수열을 말한다. N이 주어졌을 때, 1보다 크거나 같고, N보다 작거나 같은 한수의 개수를 출력하는 프로그램을 작성하시오.

### 입력

첫째 줄에 1,000보다 작거나 같은 자연수 N이 주어진다.

### 출력

첫째 줄에 1보다 크거나 같고, N보다 작거나 같은 한수의 개수를 출력한다.

## 어떻게 풀었는가

> 배열의 길이를 공차로 가지는 등차수열인지 확인해야 함

- 한수의 개수를 추적하기 위해서 `count변수`로 관리
- 1부터 입력받은 숫자가 담긴 배열 만들기
- 등차수열이면 `count변수`에 1 추가하기
- 100보다 작은 수는 길이가 1인 숫자이므로 모두 등차수열이다.
- 100이상인 수는 각 자리의 공차가 같으면 등차수열이다.

## 놓친 부분

- 각 자리의 공차를 구할 때 반복문을 돌리지 않아도 되는데 for문으로 해결하려고 하려고 했다.
- 배열이라서 인덱스로 접근이 가능하다는 사실을 놓쳤다!

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim();

function getCount(input) {
  let num = [];
  for (let i = 1; i <= input; i++) {
    num.push(i);
  }

  let count = 0;
  for (let i = 0; i <= input - 1; i++) {
    if (num[i] < 100) {
      count++;
    } else {
      let temp = String(num[i]).split("");

      if (temp[0] - temp[1] === temp[1] - temp[2]) {
        count++;
      }
    }
  }

  return console.log(count);
}

getCount(input);
```

## WILT : What I Learned Today 🤔

- 어제 풀다가 막혀서 오늘 다시 풀었는데 쉽게 해결할 수 있었다. 언제나 내 안에 해결방법이 있다!!! 이 사실 꼭 기억하고 파이팅해보자.

---

## 참고

[1065번: 한수](https://www.acmicpc.net/problem/1065)
