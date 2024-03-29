---
title: "백준 10809번 | 알파벳 찾기"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 알파벳 찾기 🔥

### 문제

알파벳 소문자로만 이루어진 단어 S가 주어진다. 각각의 알파벳에 대해서, 단어에 포함되어 있는 경우에는 처음 등장하는 위치를, 포함되어 있지 않은 경우에는 -1을 출력하는 프로그램을 작성하시오.

### 입력

첫째 줄에 단어 S가 주어진다. 단어의 길이는 100을 넘지 않으며, 알파벳 소문자로만 이루어져 있다.

### 출력

각각의 알파벳에 대해서, a가 처음 등장하는 위치, b가 처음 등장하는 위치, ... z가 처음 등장하는 위치를 공백으로 구분해서 출력한다.

만약, 어떤 알파벳이 단어에 포함되어 있지 않다면 -1을 출력한다. 단어의 첫 번째 글자는 0번째 위치이고, 두 번째 글자는 1번째 위치이다.

## 어떻게 풀었는가

- 배열의 `findIndex()` 메서드 사용해서 글자의 위치(인덱스) 가져오기
- 배열에 인덱스를 모두 담은 뒤 문자열로 변환

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("");

let alphabet = [
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "i",
  "j",
  "k",
  "l",
  "m",
  "n",
  "o",
  "p",
  "q",
  "r",
  "s",
  "t",
  "u",
  "v",
  "w",
  "x",
  "y",
  "z"
];

let result = [];

for (let i = 0; i < alphabet.length; i++) {
  let count = input.findIndex(s => s === alphabet[i]);
  result.push(count);
}

console.log(result.join(" "));
```

---

## 참고

[10809번: 알파벳 찾기](https://www.acmicpc.net/problem/10809)
