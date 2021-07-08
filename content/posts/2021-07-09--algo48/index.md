---
title: "#48 Maximum Length of Repeated Subarray (1)"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 Maximum Length of Repeated Subarray🔥

### Example 1:

```js
Input: nums1 = [1,2,3,2,1], nums2 = [3,2,1,4,7]
Output: 3
Explanation: The repeated subarray with maximum length is [3,2,1].
```

### Example 2:

```js
Input: (nums1 = [0, 0, 0, 0, 0]), (nums2 = [0, 0, 0, 0, 0]);
Output: 5;
```

---

## 접근 순서

1. `배열 nums1`의 첫 번째 요소가 `배열 nums2`에 있는지 찾기
2. 배열의 요소만큼 찾는 횟수 반복
3. 같은 숫자가 존재하면 새로운 배열에 추가하기
4. 같은 수는 `배열 nums2`에서 삭제하기
5. 새로운 배열의 길이 리턴하기

## 코드 작성

```js
let findLength = function(nums1, nums2) {
  let repeatedSubArray = [];

  for (let i = 0; i < nums1.length; i++) {
    let repeatedNumber = nums2.find(num => num === nums1[i]);

    if (repeatedNumber) {
      repeatedSubArray.push(repeatedNumber);
      let repeatedNumberIndex = nums2.indexOf(repeatedNumber);
      nums2.splice(repeatedNumberIndex, 1);
    }
  }
  return repeatedSubArray.length;
};
```

## 테스트 실패 등장

```js
Input: (nums1 = [0, 0, 0, 0, 1]), (nums2 = [1, 0, 0, 0, 0]);
Output: 5;
Expected: 4;
```

## 크나큰 문제 발견!

- 완전 다른 문제를 풀고 있었다. 연속된 배열요소를 찾는 문제였는데 나는 같은 숫자를 찾는다고 착각했다! 테스트코드를 통해서 내가 틀렸다는 사실을 깨달았다. 테스트 코드 덕분에 내가 문제를 잘못 파악했다는 사실을 발견할 수 있었다.

- 새롭게 문제를 풀기 위해 내가 생각한 방법은 1. 배열 요소가 같은게 존재하는지 찾기 2. 연속되는지 반복을 통해서 발견하기.
  그런데 실제로 어떻게 연속되는지, 몇개가 연속되는지 알아내려고 하니 갑자기 머리가 멍해졌다. 인덱스를 사용해야하나.
  아직 이 문제를 완전히 이해하지 못했다는 생각이 들었다.
  힌트에는
  `Use dynamic programming. dp[i][j] will be the answer for inputs A[i:], B[j:].`라고 나왔는데 다이나믹 프로그래밍이 도대체 뭘까
- 이런 유형의 문제는 다이나믹 프로그래밍으로 풀면 되는구나 해서 다이나믹 프로그래밍이 뭔지 검색해보았다.

## 시각화

```js
Input: nums1 = [1,2,3,2,1], nums2 = [3,2,1,4,7]
Output: 3
Explanation: The repeated subarray with maximum length is [3,2,1].
```

|     | []  | 1   | 2   | 3   | 2   | 1   |
| --- | --- | --- | --- | --- | --- | --- |
| []  | 0   | 0   | 0   | 0   | 0   | 0   |
| 3   | 0   | 0   | 0   | 1   | 0   | 0   |
| 2   | 0   | 0   | 1   | 0   | 2   | 0   |
| 1   | 0   | 1   | 0   | 0   | 0   | 3   |
| 4   | 0   | 0   | 0   | 0   | 0   | 0   |
| 7   | 0   | 0   | 0   | 0   | 0   | 0   |

<br>

---

## WILT : What I Learned Today 🤔

- 조건문을 true로만 주니까 falsy값인 0이 조건에서 제외되었다. 데이터가 어떤 boolean 값을 가지는지 생각해보는 것도 중요하다

- 다이나믹 프로그래밍에 대해 아직 이해하지 못했다. 내일 다시 개념 강의를 듣고 정리한 뒤 코드를 작성해봐야겠다. 알고리즘 난이도 `medium`은 어마어마 하구나!!

---

## 참고

[Maximum Length of Repeated Subarray | leetcode 718 | Live coding session](https://www.youtube.com/watch?v=hmXH7MzcGv4)

[Dynamic Programming - Learn to Solve Algorithmic Problems & Coding Challenges](https://www.youtube.com/watch?v=oBt53YbR9Kk&t=144s)
