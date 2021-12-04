---
title: "백준 2908번 | 상수"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 상수 🔥

### 문제

상근이의 동생 상수는 수학을 정말 못한다. 상수는 숫자를 읽는데 문제가 있다. 이렇게 수학을 못하는 상수를 위해서 상근이는 수의 크기를 비교하는 문제를 내주었다. 상근이는 세 자리 수 두 개를 칠판에 써주었다. 그 다음에 크기가 큰 수를 말해보라고 했다.

상수는 수를 다른 사람과 다르게 거꾸로 읽는다. 예를 들어, 734와 893을 칠판에 적었다면, 상수는 이 수를 437과 398로 읽는다. 따라서, 상수는 두 수중 큰 수인 437을 큰 수라고 말할 것이다.

두 수가 주어졌을 때, 상수의 대답을 출력하는 프로그램을 작성하시오.

### 입력

첫째 줄에 상근이가 칠판에 적은 두 수 A와 B가 주어진다. 두 수는 같지 않은 세 자리 수이며, 0이 포함되어 있지 않다.

### 출력

첫째 줄에 상수의 대답을 출력한다.

## 주의해야 할 점

- 숫자 크기의 정렬이 아니라 배열 요소 위치가 뒤바뀌는 것이다.

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split(" ");

let result = "";
let reversedNums = [];

for (let i = 0; i < input.length; i++) {
  let length = input[i].length;
  result = "";

  for (let j = length - 1; j >= 0; j--) {
    result += input[i][j];
  }
  reversedNums.push(result);
}

if (reversedNums[0] > reversedNums[1]) {
  console.log(reversedNums[0]);
} else {
  console.log(reversedNums[1]);
}
```

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split(" ");

let reversedInput = input.map(item => [...item].reverse().join(""));

if (reversedInput[0] > reversedInput[1]) {
  console.log(reversedInput[0]);
} else {
  console.log(reversedInput[1]);
}
```

## WILT : What I Learned Today 🤔

- 스텝 하나하나 확인해가면서 진행했더니 중간에 잘못 이해한 부분을 찾을 수 있었다.
- `reverse()`메서드를 직접 구현했다는 사실에 뿌듯하다. 자주 쓰는 메서드가 내부에서 어떻게 작동하는지 이해할 수 있는 뜻깊은 시간이었다.

---

## 참고

[2908번: 상수](https://www.acmicpc.net/problem/2908)
