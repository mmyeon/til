---
title: "#52 Search Insert Position"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 Search Insert Position 🔥

### Example 1:

```css
input: nums = [1, 3, 5, 6], target = 5;
output: 2;
```

### Example 2:

```css
input: nums = [1, 3, 5, 6], target = 2;
output: 1;
```

### Example 3:

```css
input: nums = [1, 3, 5, 6], target = 7;
output: 4;
```

### Example 4:

```css
input: nums = [1, 3, 5, 6], target = 0;
output: 0;
```

### Example 5:

```css
input: nums = [1], target = 0;
output: 0;
```

---

## 접근방법

- 배열안에 타겟넘버가 있을 경우와 없을 경우를 나눠서 생각
- 두 경우에 모두 인덱스 리턴하는 건 동일
- 처음엔 타겟 넘버가 있는 경우를 기준으로 코드 짜다가, 없다는 예외처리만 하면 코드가 간결해지는 걸 발견!

---

## 코드

```js
var searchInsert = function(nums, target) {
  if (!nums.includes(target)) {
    nums.push(target);
    nums.sort(function(a, b) {
      return a - b;
    });
  }

  return nums.indexOf(target);
};
```

---

## WILT : What I Learned Today 🤔

- 오랜만에 풀어본 알고리즘!
- 쉬운 문제부터 차근차근 풀어봅시다!

---

## 참고

[35. Search Insert Position](https://leetcode.com/problems/search-insert-position/)
