---
title: "문제 45 : Reversing an array"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 Reversing an array 🔥

### 원본 배열 유지하면서 reverse하기

```js
function reverseArray(arr) {
  let newArr = [];

  for (let i = arr.length - 1; i >= 0; i--) {
    newArr.push(arr[i]);
  }

  return newArr;
}

console.log(reverseArray(["A", "B", "C"]));
// → ["C", "B", "A"];
```

---

### 원본 배열 <b>변경</b>하면서 reverse하기

### 내 코드

- 1. 4를 배열의 끝에 추가한 뒤에
- 2. 4를 삭제한다.
- 배열의 중간 요소를 선택해야하는 과정에서 혼란이 많이 생겼다

```js
function reverseArrayInPlace(arr) {
  for (let i = arr.length - 2; i >= 0; i--) {
    arr.push(arr[i]);
    arr.splice(arr[i - 1], 1);
  }
  return arr;
}

let arrayValue = [1, 2, 3, 4, 5];
reverseArrayInPlace(arrayValue);
console.log(arrayValue);
// → [5, 4, 3, 2, 1]
```

### 코드 정답

- 1. 배열의 첫 번째 요소와 마지막 요소를 swap한다
- 2. 배열의 두 번째 요소와 마지막 두 번째 요소와 swap한다
- 이러면 중간 배열요소는 건드리지 않아도 된다!

```js
function reverseArrayInPlace(arr) {
  for (let i = arr.length - 2; i >= 0; i--) {
    arr.push(arr[i]);
    arr.splice(arr[i - 1], 1);
  }
  return arr;
}

let arrayValue = [1, 2, 3, 4, 5];
reverseArrayInPlace(arrayValue);
console.log(arrayValue);
// → [5, 4, 3, 2, 1]
```

---

## WILT : What I Learned Today 🤔

### 헤맸던 부분

- 의도와는 다르게 동작했을때 작동 순서에 대해 고민하는 시간을 충분히 가지지 않고 코드를 수정했다(뜨아!!). 버그의 늪에 빠져버렸다!

### 새롭게 배운 부분

- 작동 순서를 직접 글로 적으니 어려웠던 부분을 이해할 수 있었다. 내일부터는 <b>알고리즘을 어떻게 풀려고 시도했는지</b>에 대해 자세히 적어야겠다. 한 문제 풀고 안풀고가 중요한 게 아니고 정확히 이해하는 게 중요하다.

---

## 내일부터 적용할 알고리즘 포스팅 포맷 🤔

- ### 알고리즘 이름

- ### 문제 파악

- ### 어떻게 해결할 것인가

- ### 코드 작성하면서 만난 실수, 어려움은?

- ### 코드에 개선할 부분이 있는가? 어느 부분에서 냄새가 나는 것 같은가?
