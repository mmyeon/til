---
title: "백준 10871번 | X보다 작은 수"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 X보다 작은 수 🔥

### 문제

정수 N개로 이루어진 수열 A와 정수 X가 주어진다. 이때, A에서 X보다 작은 수를 모두 출력하는 프로그램을 작성하시오.

### 입력

첫째 줄에 N과 X가 주어진다. (1 ≤ N, X ≤ 10,000)
둘째 줄에 수열 A를 이루는 정수 N개가 주어진다. 주어지는 정수는 모두 1보다 크거나 같고, 10,000보다 작거나 같은 정수이다.

### 출력

X보다 작은 수를 입력받은 순서대로 공백으로 구분해 출력한다. X보다 작은 수는 적어도 하나 존재한다.

## 코드

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .split("\n");

let output = "";
let firstInput = input[0].split(" ");
let length = firstInput[0];
let target = firstInput[1];
let arr = input[1].split(" ");

for (let i = 0; i < length; i++) {
  if (Number(arr[i]) < target) {
    output += arr[i] + " ";
  }
}

console.log(output.slice(0, -1));
```

다른 분의 코드를 참고해서 배열을 사용해 더 가독성 좋게 작성해보았다.

```js
let fs = require("fs");
let input = fs
  .readFileSync("example.txt")
  .toString()
  .split("\n");

let target = Number(input[0].split(" ")[1]);
let numArr = input[1].split(" ").map(item => Number(item));
let result = numArr.filter(num => num < target);

console.log(result.join(" "));
```

## WILT : What I Learned Today 🤔

- 이 코드를 나중에 다시 들여다본다고 생각하고 더 클린하게 짜도록 노력해야겠다. 변수로 왜 선언하는지, 변수명은 적절한지, 데이터 타입을 왜 일관성있게 작성하지 않았는지 등 내가 짜는 코드에 대해 질문을 던지면서 스스로 설명할 수 있는 코드를 짜야겠다고 다짐해본다. 단순히 동작하는 걸 넘어서 좋은 코드를 향해 나아가자!

---

## 참고

[10871번: X보다 작은 수](https://www.acmicpc.net/problem/10871)
