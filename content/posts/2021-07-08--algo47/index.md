---
title: "#47 Palindrome Number "
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 Palindrome Number🔥

### Example 1:

```js
Input: x = 121;
Output: true;
```

### Example 2:

```js
Input: x = -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
```

### Example 3:

```js
Input: x = 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
```

### Example 4:

```js
Input: x = -101;
Output: false;
```

---

## 접근 순서

1. 입력받은 숫자를 문자열로 변경
2. 문자열을 배열로 변환
3. 배열을 reverse 하기
4. 배열 요소 하나의 문자열로 합치기
5. 문자열을 숫자로 변환
6. 원본과 거꾸로 뒤집은 숫자가 같으면 true, 아니면 false 리턴하기.

## 코드 작성

```js
let isPalindrome = function(x) {
  let reversedX = parseInt(
    x
      .toString()
      .split("")
      .reverse()
      .join("")
  );

  return x === reversedX ? true : false;
};
```

---

## WILT : What I Learned Today 🤔

- 알고리즘 뿐만 아니라 개인 프로젝트에서도 입력받은 데이터의 타입을 체크하지 않아서 코드 오류가 발생하는 경험을 했다. 지금 입력받은 데이터의 타입이 무엇인지, 내가 바꾸고자 하는 데이터의 타입은 무엇이고, 어떤 메서드를 사용하면 되는지에 대해 고민하는 시간을 충분히 가져야겠다.

- 좀 더 도전적인 수련을 위해서 알고리즘 난이도롤 섞어서 풀어보려고 한다. 홀수일에는 난이도 `medium`을 도전할 예정이다.
