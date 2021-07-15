---
title: "#50 Longest Common Prefix"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 Longest Common Prefix 🔥

### Example 1:

```js
Input: strs = ["flower", "flow", "flight"];
Output: "fl";
```

### Example 2:

```js
Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
```

---

## 코드 작성

```js
const longestCommonPrefix = function(strs) {
  let result;
  let prefix = "";
  for (let i = 0; i < strs.length; i++) {
    result = strs.filter(str => str.slice(i, i + 1) === strs[0][i]);

    if (strs.length === result.length) {
      prefix += strs[0][i];
    } else {
      break;
    }
  }

  return prefix === "" ? "" : prefix;
};
```

### 또 다른 접근법

첫 번째 요소를 기준이 되는 prefix로 정한 뒤
`Str.indexOf()`와 `Str.substring()` 메서드를 사용해서 prefix 범위 줄이기

```js
const longestCommonPrefix = function(strs) {
  let prefix = strs[0];

  for (let i = 1; i < strs.length; i++) {
    while (strs[i].indexOf(prefix) !== 0) {
      prefix = prefix.substring(0, prefix.length - 1);
    }
  }

  return prefix;
};
```

---

## WILT : What I Learned Today 🤔

- 패턴을 발견하자. 비교를 하려면 기준이 필요하다. 첫 배열이 요소를 기준으로 정하고 값을 비교하니까 가독성도 좋아지고 훨씬 코드가 단순해졌다. 처음부터 잘하긴 어려우니 우선 문제를 해결하고, 그 다음에 더 나아질 방향에 대해 계속 고민해보자. 오늘도 한 문제를 풀어냈다 아자!
