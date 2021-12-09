---
title: "백준 1316번 | 그룹 단어 체커"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 그룹 단어 체커 🔥

### 문제

그룹 단어란 단어에 존재하는 모든 문자에 대해서, 각 문자가 연속해서 나타나는 경우만을 말한다. 예를 들면, ccazzzzbb는 c, a, z, b가 모두 연속해서 나타나고, kin도 k, i, n이 연속해서 나타나기 때문에 그룹 단어이지만, aabbbccb는 b가 떨어져서 나타나기 때문에 그룹 단어가 아니다.

단어 N개를 입력으로 받아 그룹 단어의 개수를 출력하는 프로그램을 작성하시오.

### 입력

첫째 줄에 단어의 개수 N이 들어온다. N은 100보다 작거나 같은 자연수이다. 둘째 줄부터 N개의 줄에 단어가 들어온다. 단어는 알파벳 소문자로만 되어있고 중복되지 않으며, 길이는 최대 100이다.

### 출력

첫째 줄에 그룹 단어의 개수를 출력한다.

### 어떻게 풀었는가

- aa처럼 연속해서 입력되는 문자를 하나의 문자로 인식하기 위해서 새로운 배열을 만들어서 관리했다.
- 같은 문자가 떨어져서 입력되는 경우를 알아내기 위해서 `filter()`메서드를 사용했다. 값의 처음 인덱스와 비교해서 다른 경우 `duplicate`변수에 담았다.
- `duplicate`변수의 길이가 0인 경우는 중복이 없다는 뜻이므로 `groupWordCount`를 1씩 증가시켰다.

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("\n");

let length = input[0];
let unique = [];
let groupWordCount = 0;

for (let i = 1; i <= length; i++) {
  let word = input[i];

  for (let j = 0; j < word.length; j++) {
    if (j === 0) {
      unique.push(word[0]);
    }

    if (!unique.includes(word[j]) || unique[unique.length - 1] !== word[j]) {
      unique.push(word[j]);
    }
  }

  let duplicate = unique.filter((item, index) => unique.indexOf(item) !== index);
  if (duplicate.length === 0) {
    groupWordCount++;
  }

  unique = [];
}

console.log(groupWordCount);
```

## WILT : What I Learned Today 🤔

- 이틀 고민해서 문제를 풀 수 있었다.
- 문제가 어렵다고 생각하면 어렵게 푸는 방법을 찾는 경향이 있다. 쉽다고 생각하고 접근해보자.
- 내가 생각한 방법이 조금 구리다는 생각이 들어서 이걸 어쩌지. 더 나은 방법은 뭐지 고민하다가 '아무것도 떠오르지 않음' 늪에 빠졌다. 더 이상 답이 안 보여서 우선 구현하고 나중에 개선하자고 마음을 다 잡고 시간을 투자했더니 혼자서 풀 수 있었다.

---

## 참고

[1316번: 그룹 단어 체커](https://www.acmicpc.net/problem/1316)
