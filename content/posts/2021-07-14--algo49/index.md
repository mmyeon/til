---
title: "#49 Roman to Integer"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 Roman to Integer 🔥

### Roman symbols

```js
Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
```

### Example 1:

```js
Input: s = "III";
Output: 3;
```

### Example 2:

```js
Input: s = "IX";
Output: 9;
```

### Example 3:

```js
Input: s = "LVIII";
Output: 58;
Explanation: (L = 50), (V = 5), (III = 3);
```

### Example 4:

```js
Input: s = "MCMXCIV"
Output: 1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
```

---

## 체크할 부분

- 문자의 숫자값인 cur, next 비교해서 add / subtract 결정하기
- 조건문 필요
- 반복문 필요

## 코드 작성

```js
function romanToInt(s) {
  const key = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
  };

  let result = [];

  for (let i = 0; i < s.length; i++) {
    if (key[s[i]] < key[s[i + 1]]) {
      result.push(key[s[i + 1]] - key[s[i]]);
      i++;
      continue;
    } else {
      result.push(key[s[i]]);
    }
  }

  return result.reduce((prev, current) => prev + current);
}
```

### 또 다른 접근법

```js
function romanToInt(s) {
  const key = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
  };

  let result = 0;

  for (let i = 0; i < s.length; i++) {
    const cur = key[s[i]];
    const next = key[s[i + 1]];

    if (cur < next) {
      result += next - cur;
      i++;
    } else {
      result += cur;
    }
  }

  return result;
}
```

---

## WILT : What I Learned Today 🤔

- 모든 조건을 처리해야한다고 생각하고 작업하니까 코드를 작성하기가 어려웠다. 결국 혼자 작성하지 못하고 다른 사람 코드를 참고헤서 작성했는데 예외 코드를 먼저 작성하니 그 외의 코드를 관리하기가 무척 쉬웠다. 이렇게 하면 될 것 같은데 생각이 들면 baby step으로 기록하고, 더 단순하고 좋은 방법이 없을지 고민해보자

- `continue`와 `break`의 차이에 대해 명확하게 알게 되었다

| `break`    | 반복문을 종료                                            |
| ---------- | -------------------------------------------------------- |
| `continue` | 현재 반복에서의 명령을 종료하고 다음 반복조건으로 건너뜀 | --- |

---

## 참고

[Roman Numeral To Integer - LeetCode Algorithm Solution + Code Vanilla Javascript](https://www.youtube.com/watch?v=EP1TLVfOOYo)

[[알고리즘 - LeetCode] Roman to Integer](https://velog.io/@yejinh/%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98-LeetCode-Roman-to-Integer)
