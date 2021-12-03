---
title: "백준 1152번 | 단어의 개수"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 단어의 개수 🔥

### 문제

영어 대소문자와 공백으로 이루어진 문자열이 주어진다. 이 문자열에는 몇 개의 단어가 있을까? 이를 구하는 프로그램을 작성하시오. 단, 한 단어가 여러 번 등장하면 등장한 횟수만큼 모두 세어야 한다.

### 입력

첫 줄에 영어 대소문자와 공백으로 이루어진 문자열이 주어진다. 이 문자열의 길이는 1,000,000을 넘지 않는다. 단어는 공백 한 개로 구분되며, 공백이 연속해서 나오는 경우는 없다. 또한 문자열은 공백으로 시작하거나 끝날 수 있다.

### 출력

첫째 줄에 단어의 개수를 출력한다.

## 주의해야 할 점

- 빈 문자열이 포함되어 있을 수 있기 때문에 `filter()`메서드로 빈 문자열이 제거되도록 처리했다.

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split(" ");

let unique = input.filter(item => item !== "");

console.log(unique.length);
```

## WILT : What I Learned Today 🤔

- 오늘은 큰 무리 없이 풀었다. 꺄. 이런 날도 있군!

---

## 참고

[1152번: 단어의 개수](https://www.acmicpc.net/problem/1152)
