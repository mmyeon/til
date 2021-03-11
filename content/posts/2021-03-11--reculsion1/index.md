---
title: "문제 43: 재귀함수(1)"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 문제로 배워보는 재귀함수🔥

- 내가 나를 호출하는 함수
- 반복문과 재귀함수는 서로 호환이 됨 (**반복문 <-> 재귀함수**)
- 반복문으로 표현할 수 있는 건 재귀함수로 표현할 수 있음.
- 반복문은 밑에서부터 높은 숫자로 올라가는 방식이고, 재귀함수는 위에서 아래로 내려가는 방식.
- **재귀함수는 종료조건이 무조건 있어야함**. 없으면 무한반복됨.

## 🔥 빅오표기법 : 얼마만큼 반복하고 있는가 🔥

- `O(n)` : n이 커질수록 비례해서 반복횟수가 증가한다. (반복문)
- `O(1)` : 반복없이 바로 실행된다.

```js
console.log((n * (n + 1)) / 2);
```

## 🔥 1부터 100까지의 합 🔥

### 반복문

```js
let sum = 0;
let n = 100;

for (let i = 1; i < n + 1; i++) {
  sum += i;
}

console.log("반복문", sum);
```

### 재귀함수

```js
function sumAll(n) {
  if (n <= 1) {
    return 1;
  }
  return n + sumAll(n - 1);
}

console.log("재귀함수", sumAll(100));
```

## 🔥 1부터 5까지의 곱🔥

### 반복문

```js
let multiple = 1;
let n = 5;

for (let i = 1; i < n + 1; i++) {
  multiple *= i;
}

console.log("반복문", multiple);
```

### 재귀함수

```js
function multipleAll(n) {
  if (n <= 1) {
    return 1;
  }
  return n * multipleAll(n - 1);
}

console.log("재귀함수", multipleAll(5));
```

## 🔥 11을 2진수 변환하기 🔥

| ------ | ----- | 나머지 |
| :----: | :---: | :----: |
|   2    |  11   |   1    |
|   2    |   5   |   1    |
|   2    |   2   |   0    |
|        |   1   |        |

> 출력 : 1011

### 반복문

```js
let binaryResult = "";
let x = 11;

while (true) {
  // 무한반복 시작
  if (x % 2 === 0) {
    binaryResult += "0";
  } else {
    binaryResult += "1";
  }
  x = Math.floor(x / 2);

  // 종료조건
  if (x == 1 || x == 0) {
    // 맨 마지막 x값을 넣어준다
    binaryResult += String(x);
    break;
  }
}

console.log(
  "binaryResult",
  binaryResult
    .split("")
    .reverse()
    .join("")
);
```

### 재귀함수

```js
function convert(x) {
  if (x === 1 || x === 0) {
    return String(x);
  }
  return convert(Math.floor(x / 2)) + String(x % 2);
}

console.log("convert", convert(11));
```

### 작동원리

|             |        실행결과         |     |       값        |
| :---------: | :---------------------: | :-: | :-------------: |
| convert(11) | convert(5) + String(1); | =>  | 101 + String(1) |
| convert(5)  | convert(2) + String(1); | =>  | 10 + String(1)  |
| convert(2)  | convert(1) + String(0); | =>  |  1 + String(0)  |
| convert(1)  |            1            |     |

</br>

---

## WILT : What I Learned Today 🤔

- 효율을 고려하기 위해서 내가 푸려는 문제의 수학공식이 이미 존재하는지 찾아보는 게 좋다는 팁을 얻었다.
- 소수점 관리하기</br>
  `Math.ceil()` : 소수점 올림</br>
  `Math.floor()` : 소수점 버림</br>
  `Math.round()` : 소수점 반올림</br>
- 코드 작동 원리 생각해보는 시간을 가지니 더 이해가 잘 되었다.
- 자바스크립트 인터프리터가 `while문`을 만나면 조건을 확인한 뒤 코드를 한 번 실행한다. `break`가 없다면 실행이 끝난 뒤 다시 조건을 확인한 후 참이면 코드가 반복 실행된다. 따라서 조건이 true이고 `break`가 존재하지 않는다면 무한 반복의 길을 걷게 된다.
