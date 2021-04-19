---
title: "문제 44 : The sum of a range"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 The sum of a range 🔥

### 원하는 결과

```js
console.log(range(1, 10));
// → [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
console.log(range(5, 2, -1));
// → [5, 4, 3, 2]
console.log(sum(range(1, 10)));
// → 55
```

### 해결

```js
function range(start, end, step = 1) {
  let array = [];

  if (step > 0) {
    for (let i = start; i <= end; i += step) array.push(i);
  } else {
    for (let i = start; i >= end; i += step) array.push(i);
  }
  return array;
}

function sum(array) {
  let total = 0;
  for (let value of array) {
    total += value;
  }
  return total;
}
```

---

## WILT : What I Learned Today 🤔

### 헤맸던 부분

- 숫자가 늘어나는 step과 숫자가 줄어드는 step을 동시에 처리하려고 하다보니 무한루프에 빠지게 되었다. 문제풀기 전에 충족시켜야 하는 조건을 간단하게 정리하고 코드를 작성하는 게 덜 헤매는 방법이 될 것 같다.

### 새롭게 배운 부분

- for..of문은 잘 안써봤는데 써보니 간결해서 좋았다!
- for..of에 대해 검색하보니 iterable객체가 등장해서 익숙하지 않은 개념이라 문서를 읽어보았다. [iterable 객체](https://ko.javascript.info/iterable)

### 다음에 적용할 부분

- 내일 알고리즘 풀면서 할 일 : 문제 파악 > 요구사항 정리 > 조건을 충족하는 나의 해결방법 구체화 > 코드 작성 시작
