---
title: "문제44 : 재귀함수(2)"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 문자열 뒤집기🔥

### 1. 내장메서드 사용하기

```js
const x = "mallang";
console.log(
  x
    .split("")
    .reverse()
    .join("")
);
```

### 2. 반복문

```js
let result = "";
let x = "mallang";

while (true) {
  if (x.length === 1) {
    result += x;
    break;
  }
  // pop메서드 사용하기 위해서 배열로 변환
  let xArr = x.split("");

  // pop메서드 사용, 원본배열 변경됨
  result += String(xArr.pop());
  x = xArr.join("");
}

console.log("result", result);
```

### 3. 재귀함수

```js
function reverseString(x) {
  if (x.length === 1) {
    return x;
  }

  return x[x.length - 1] + reverseString(x.slice(0, x.length - 1));
}

console.log("reverseString", reverseString("mallang")); //gnallam
```

### 작동원리

|                          |           실행결과            |     |   값    |
| :----------------------: | :---------------------------: | :-: | :-----: |
| reverseString("mallang") | "g" + reverseString("mallan") | =>  | gnallam |
| reverseString("mallan")  | x[5] + reverseString("malla") | =>  | nallam  |
|  reverseString("malla")  | x[4] + reverseString("mall")  | =>  |  allam  |
|  reverseString("mall")   |  x[3] + reverseString("mal")  | =>  |  llam   |
|   reverseString("mal")   |  x[2] + reverseString("ma")   | =>  |   lam   |
|   reverseString("ma")    |   x[1] + reverseString("m")   | =>  |   am    |
|    reverseString("m")    |              "m"              |

</br>

---

## WILT : What I Learned Today 🤔

- 아직 혼자 재귀코드를 짜는게 쉽지 않다. 재귀에 대해 설명할 수 있도록 두 문제를 더 풀어봐야겠다.
- 다음 포스팅에서 재귀와 실행순서에 대해서 더 자세히 기록하고 싶다😊
