---
title: "#46 Reverse Integer "
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 Reverse Integer 🔥

### Example 1:

```js
Input: x = 123;
Output: 321;
```

### Example 2:

```js
Input: x = -123;
Output: -321;
```

### Example 3:

```js
Input: x = 120;
Output: 21;
```

### Example 4:

```js
Input: x = 0;
Output: 0;
```

---

## 접근 순서

1. 입력받은 숫자를 문자열로 변경
2. reverse메서드 사용하기 위해서 문자열 배열로 변환
3. reverse 메서드 사용
4. 문자열을 실수로 변환하기
5. negative 반영하기
6. reversed value가 `-231 <= x <= 231 - 1` 조건을 충족시키지 않으면 `0` 리턴하기

```js
let reversed = function(x) {
  let reversedNumber =
    parseFloat(
      x
        .toString()
        .split("")
        .reverse()
        .join("")
    ) * Math.sign(x);

  if (-Math.pow(2, 31) <= reversedNumber && reversedNumber <= Math.pow(2, 31) - 1) {
    return reversedNumber;
  } else {
    return 0;
  }
};
```

---

## WILT : What I Learned Today 🤔

### 코드 작성하면서 만난 실수, 어려움은?

- `-Math.pow(2, 31) <= reversedNumber <= Math.pow(2, 31)-1` 이렇게 이중으로 범위를 작성하니까 항상 true값이 나왔다. 잠시 멈춰서 생각했으면 발견헀을텐데 당연히 조건은 문제없어!라고 생각하고 다른 부분의 코드를 수정하느라 시간을 조금 낭비했다. 오류가 발생했다면 어디서 오류가 발생했는지 범위를 줄이는 작업이 매우 중요하다는 걸 배웠다.

### 새롭게 배운 부분

- 자바스크립트에서는 조건별로 각각 분리해야 된다는 걸 배웠다. `-Math.pow(2, 31) <= reversedNumber && reversedNumber <= Math.pow(2, 31)-1`

- `parseFloat(string)` : 문자열을 실수로 바꾸는 함수이다. 이 함수 덕분에 `Example 3`을 충족시킬 수 있었다.

---

## 참고

[How to reverse a number in JavaScript](https://www.freecodecamp.org/news/js-basics-how-to-reverse-a-number-9aefc20afa8d/)
