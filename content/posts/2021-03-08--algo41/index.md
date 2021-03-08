---
title: "문제41 : 소수판별"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 주어진 숫자가 소수인지 아닌지 판별하기 🔥

### 소수 : 1보다 크면서 자기 자신이나 1로만 나눠지는 수

> 소수이면 YES, 소수가 아니면 NO 출력하기

## 나의 접근법

- 소수 구하는 유튜브 영상 찾아보기
- 소수가 아닌 조건 확인하기
  - 2, 3, 5, 7로 나누었을 때 나머지가 0이 나오는 경우
  - 1은 소수가 아님

```js
const num = parseInt(prompt("숫자를 입력하세요"), 10);

function isPrimeNumber(num) {
  if (num === 2 || num === 3 || num === 5 || num === 7 || num === 11 || num === 13) {
    return console.log("YES");
  } else if (num % 2 === 0 || num % 3 === 0 || num % 5 === 0 || num % 7 === 0) {
    return console.log("NO");
  } else if (num === 1) {
    return console.log("NO");
  }
}

isPrimeNumber(num);
```

## 내 코드의 문제점

- 생각의 정리 없이 코드를 작성하기 시작해서 조건에 포함되지 않는 숫자가 존재하게 되었다
- 숫자 113이 `undefined`로 나옴
- 소수가 아닌 조건만 정의내리고 나면, 그 외에는 다 소수가 됨
- 소수인지 체크하는 함수이므로 함수명 checkPrime으로 변경하기

## 개선하기

```js
const num = parseInt(prompt("숫자를 입력하세요"), 10);

function checkPrime(num) {
  if (num === 1) {
    console.log("NO");
    return;
  }

  for (let i = 2; i < num; i++) {
    const result = num % i;
    if (result === 0) {
      console.log("NO");
      return;
    }
  }
  console.log("YES");
}

checkPrime(num);
```

---

## WILT : What I Learned Today 🤔

- 내가 아닌 다른 사람이 코드를 봐도 규칙을 이해하도록 코드를 작성한 뒤 개선해보는 시간을 갖자.
- **내일부터 적용할 문제 풀이 과정**
- 우선 구현 하기 -> 문제 해결 뒤 반복되는 부분이 있는지, 내가 아닌 다른 사람이 코드를 읽기에 가독성이 좋은지 체크해서 개선하기(5분)
