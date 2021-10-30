---
title: "#53 Move Zeroes"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 Search Insert Position 🔥

### Example 1:

```js
Input: nums = [0, 1, 0, 3, 12];
Output: [1, 3, 12, 0, 0];
```

### Example 2:

```js
Input: nums = [0];
Output: [0];
```

---

## 접근방법

- 요소의 값이 0인지 확인
- 0인 경우, 배열의 끝에 0 추가하고 해당 요소 삭제

---

## 코드

```js
var moveZeroes = function(nums) {
  for (let i = nums.length - 1; i >= 0; i--) {
    if (nums[i] === 0) {
      nums.push(0);
      nums.splice(i, 1);
    }
  }

  return nums;
};
```

---

## WILT : What I Learned Today 🤔

- 내가 처음 시도했던 방법은 값이 0인 요소를 삭제하려고 했는데 그렇게 진행하니 요소 순서가 변경돼 인덱스의 의미가 없어지는 문제가 발생했다. 그때 기존 반복문을 수정해서 배열의 길에에서 부터 반복문을 돌릴 생각을 못하고 다른 방법을 찾으려고 노력했다. 잘 작동하는 코드를 작성하고 나니 그 부분이 아쉽다. 조금 더 현재 코드를 개선하는 방법으로 진행했더라면 훨씬 빨리 찾을 수 있었을 것 같다.
- 우선 작동하도록 구현하기 -> 리팩토링을 통해 더 좋은 코드로 리팩토링하기. 그러면서 배우는 것들이 생길 것이다!

---

## 참고

[283. Move Zeroes](https://leetcode.com/problems/move-zeroes/)
