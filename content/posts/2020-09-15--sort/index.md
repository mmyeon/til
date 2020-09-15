---
title: "배열 요소를 정렬하고 싶다면?"
tags: ["JS"]
cover: sort.jpg
author: mmyeon
---

## array.sort()

> 배열의 요소를 정렬해서 리턴함<br>
>
> `원본 배열이 바뀜`<br>
>
> > 값을 문자열로 다뤄서 정렬함. <br>그래서 "25"가 "100"보다 더 크다 → 파라미터로 함수를 제공하면 원하는 값 얻을 수 있음

예시를 통해 살펴보자.

```js
let fruit = ["cherries", "apples", "bananas"];
fruit.sort(); // ['apples', 'bananas', 'cherries']

let myArray = [1, 2, 13, 23];
console.log(myArray.sort());
// [1, 13, 2, 23]
```

<br>

---

## 숫자 크기 순서대로 정렬하고 싶다면?

> `sort() 메서드에 파라미터 전달하기`

### 오름차순 정렬

```js
let array = [40, 50, 1, 5, 25];

array.sort(function(a, b) {
  return a - b;
});

// [1, 5, 25, 40, 50]
```

### 내림차순 정렬

```js
let array = [40, 50, 1, 5, 25];

array.sort(function(a, b) {
  return b - a;
});

// [50, 40, 25, 5, 1]
```

<br>

---

### 참고

[JavaScript Array sort() Method](https://www.w3schools.com/jsref/jsref_sort.asp)
