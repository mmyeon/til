---
title: "문제 43 : Minimum / Recursion / Bean counting"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 Minimum 🔥

### Math.min() 구현하기

```js
function min(x, y) {
  if (x < y) return x;
  return y;
}

console.log(min(0, 10));
// → 0
console.log(min(0, -10));
// → -10
```

## 🔥 Recursion 🔥

### 재귀함수 = 자기 자신을 호출하는 함수, <br>

### 계속 호출한다는 의미니까 종료 조건이 매우 중요함!

### 조건

- Zero is even.
- One is odd.
- For any other number *N*, its evenness is the same as *N* - 2.
- 숫자가 네거티브일 때도 함수 정상 실행되도록 하기

```js
function isEven(n) {
  if (n === 0) {
    return true;
  } else if (n === 1) {
    return false;
  } else if (n < 0) {
    return isEven(-n);
  } else {
    return isEven(n - 2);
  }
}
```

## 🔥 Bean counting 🔥

글자 수 카운트하기

- 문자열 인자로 받기
- 원하는 글자가 몇 번 반복되었는지 반복문 돌리기
- 반복이 끝난 뒤에 counter 리턴하기

```js
function countBs(str) {
  return countChar(str, "B");
}

function countChar(str, character) {
  let count = 0;
  for (let i = 0; i < str.length; i++) {
    if (str[i] === character) {
      count += 1;
    }
  }
  return count;
}

console.log(countBs("BBC"));
// → 2
console.log(countChar("kakkerlak", "k"));
// → 4
```

---

## WILT : What I Learned Today 🤔

- 다시 만난 재귀함수. 코드를 작성하면서 종료조건을 확실히 해야 한다는 걸 배웠다.
- Eloquen JS를 읽으면서 그냥 넘겼던 코드에 대해 이해하려고 노력중이다.
- 코드가 중복되는 부분에 대해서 스스로 개선하는 습관을 가져야겠다. <b>리팩토링 생활화</b>!
