---
title: "Sum All Numbers in a Range"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## Sum All Numbers in a Range

두 배열의 값 사이의 모든 숫자를 더한 합계를 구하시오.

### 예시

sumAll([1, 4]) should return 10.</br>
sumAll([5, 10]) should return 45.</br>
sumAll([10, 5]) should return 45.</br>

---

### 나의 접근법

인풋 : 배열</br>
아웃풋 : 합계 값

- 배열의 요소를 정렬한다
- 반복문을 통해서 값을 더해나간다.

```js
function sumAll(arr) {
  arr.sort(function(a, b) {
    return a - b;
  });

  let sum = 0;
  for (let i = arr[0]; i <= arr[arr.length - 1]; i++) {
    sum += i;
  }
  return sum;
}

sumAll([1, 4]);
```

---

### 또 다른 방법

- 배열에서 maxNum을 구한다
- minNum을 구한다
- 새로운 배열에 minNum과 maxNum사이의 숫자를 반복해서 추가한다.

```js
function sumAll(arr) {
  const newArr = [];
  const maxNum = Math.max(...arr);
  const minNum = Math.min(...arr);
  newArr[0] = minNum;

  let i = 1;
  while (minNum + i < maxNum) {
    newArr.push(minNum + i);
    i++;
  }

  newArr.push(maxNum);
  let result = newArr.reduce((a, b) => a + b);
  return result;
}

sumAll([1, 4]);
```
