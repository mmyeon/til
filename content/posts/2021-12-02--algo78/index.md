---
title: "백준 1157번 | 단어 공부"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 단어 공부 🔥

### 문제

알파벳 대소문자로 된 단어가 주어지면, 이 단어에서 가장 많이 사용된 알파벳이 무엇인지 알아내는 프로그램을 작성하시오. 단, 대문자와 소문자를 구분하지 않는다.

### 입력

첫째 줄에 알파벳 대소문자로 이루어진 단어가 주어진다. 주어지는 단어의 길이는 1,000,000을 넘지 않는다.

### 출력

첫째 줄에 이 단어에서 가장 많이 사용된 알파벳을 대문자로 출력한다. 단, 가장 많이 사용된 알파벳이 여러 개 존재하는 경우에는 ?를 출력한다.

## 어떻게 풀었는가

- 인풋값이 하나일 경우 예외 처리
- `toUpperCase()`메서드 사용해서 인풋 배열의 요소를 모두 대문자로 변경해주기
- `new Set()`을 이용해서 중복없는 요소를 변수에 담기
- `filter()`메서드를 사용해서 중복되는 요소 찾아내기
- 새로운 배열에 중복 횟수를 담기. 이때 중복 요소의 인덱스와 동일하게 유지하기
- 최대 반복 숫자의 개수를 파악한 뒤 값 리턴하기

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split("");

let upperStringList = input.map(item => item.toUpperCase());
let uniqueList = Array.from(new Set(upperStringList));
let duplicateList = [];

for (let i = 0; i < uniqueList.length; i++) {
  let duplicate = upperStringList.filter(item => uniqueList[i] === item);
  duplicateList.push(duplicate.length);
}

let max = Math.max(...duplicateList);
let target = duplicateList.filter(item => item === max);

if (target.length > 1) {
  console.log("?");
} else {
  let targetIndex = duplicateList.indexOf(max);
  console.log(uniqueList[targetIndex]);
}
```

## WILT : What I Learned Today 🤔

- 처음에는 원본 배열을 정렬한 뒤 요소들을 하나씩 삭제하는 방식으로 진행했더니 메모리 초과가 나왔다. 그 이후로는 문자열의 이전 반복값과 현재의 반복값을 비교하는 방법을 사용했더니 코드 길이가 늘어나서 가독성이 너무 떨어졌다. 더 쉬운 방법을 찾느라 시간을 많이 써야했다.
- 오전에 풀다가 막혀서 자기 전에 다시 시도해서 결국 풀었다.
- 값을 비교할 때 새로운 배열에 같은 인덱스를 가지도록 추가해주면 비교하기가 쉽다는 걸 배웠다.
- 어렵기도 했고 헤맸지만 그래도 결국 풀었다. 많이 부족하지만 계속 풀어가보자!

---

## 참고

[1157번: 단어 공부](https://www.acmicpc.net/problem/1157)
