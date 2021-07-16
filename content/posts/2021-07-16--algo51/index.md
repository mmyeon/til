---
title: "#51 Valid Parentheses"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 Valid Parentheses 🔥

### Example 1:

```js
Input: s = "()";
Output: true;
```

### Example 2:

```js
Input: s = "()[]{}";
Output: true;
```

### Example 3:

```js
Input: s = "(]";
Output: false;
```

### Example 4:

```js
Input: s = "([)]";
Output: false;
```

### Example 5:

```js
Input: s = "{[]}";
Output: true;
```

---

### 혼자 풀었는가? 못풀었다면 어떻게 접근했는가?

혼자 풀지 못했다. open parenthesis의 index와 close parenthesis의 index 사이의 패턴을 찾으려고 하니까 경우의 수가 많아서 모든 테스트를 통과하지 못했다.
그래도 테스트를 하나씩 풀어가면서 내가 놓친 부분에 대해 인지하게 되었다. 같은 bracket이 반복되는 경우도 발생하기에 배열에서 해당 부분을 제거하고 추가하는 작업이 필요하다는 걸 발견했다.

---

## 접근방법

1. 왼쪽에서 오른쪽으로 string 분석하기
2. 시작 parenthesis를 발견하면 `Stack` 데이터 구조에 push하기. 왜냐면 `Last In First Out(LIFO)` 특징이 있기 떄문이다.
3. 끝 parenthesis를 만나면, stack의 `top`에 있는지 확인해보기. stack에 있는 시작 parenthesis와 짝을 이루면 앞으로 나아가고 아니면 false 리턴하기
4. 마지막으로 stack이 비어있는지 확인하기. 열고 닫기 때문에 쌍이 맞았다면 stack은 비어있게 된다.

---

## 시간 복잡도 = O(n)

string을 한번 분석함

---

## 공간 복잡도 = O(n)

문자를 저장하기 위해 stack을 사용함

---

## 코드

```js
var isValid = function(s) {
  // 왼쪽 parenthesis를 저장할 스택
  const leftSymbols = [];

  // string 반복 돌기
  for (let i = 0; i < s.length; i++) {
    // 왼쪽 parenthesis를 만나는 경우
    if (s[i] === "(" || s[i] === "{" || s[i] === "[") {
      leftSymbols.push(s[i]);
    }

    // 오른쪽 parenthesis를 만나는 경우
    else if (
      s[i] === ")" &&
      leftSymbols.length !== 0 &&
      leftSymbols[leftSymbols.length - 1] === "("
    ) {
      leftSymbols.pop();
    } else if (
      s[i] === "}" &&
      leftSymbols.length !== 0 &&
      leftSymbols[leftSymbols.length - 1] === "{"
    ) {
      leftSymbols.pop();
    } else if (
      s[i] === "]" &&
      leftSymbols.length !== 0 &&
      leftSymbols[leftSymbols.length - 1] === "["
    ) {
      leftSymbols.pop();
    }
    // 왼쪽 parenthesis를 만나지 않고 바로 오른쪽 parenthesis를 만나는 경우
    else {
      return false;
    }
  }
  return leftSymbols.length === 0;
};
```

---

## WILT : What I Learned Today 🤔

- stack을 공부하자. 문제를 풀 수 있는 좋은 방법이 있다는 걸 배우는 시간이었다.
- 코드 작성하기 전에 조건을 단순화하는 시간을 가지자. 정리되지 않은 생각을 코드로 작성하니 점점 문제해결과 멀어지게 된다.

---

## 참고

[LeetCode #20 - Valid Parentheses](https://redquark.org/leetcode/0020-valid-parentheses/)
