---
title: "백준 1000번 | A+B"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 A+B 🔥

### 문제

> 두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.

## 코드

```js
// file system 모듈을 불러오기
let fs = require("fs");

let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .split(" ");

let a = parseInt(input[0]);
let b = parseInt(input[1]);

console.log(a + b);
```

---

## WILT : What I Learned Today 🤔

- 자동으로 테스트 케이스에 대한 입,출력을 받아주는 타 알고리즘 사이트와 다르게 백준 사이트는 테스트 케이스에 대한 입출력을 직접 작성해줘야 한다.
- fs모듈의 readFileSync 함수를 통해 해당 경로의 파일 전체를 읽어드린다.
- 백준 사이트는 `'/dev/stdin'` 경로에 있는 테스트 파일이 있다.
- 입력받은 정보를 문자열로 변환해 가공한다.

---

## 참고

[[백준/javascript] 1000번 A+B](https://leeph.tistory.com/48)
