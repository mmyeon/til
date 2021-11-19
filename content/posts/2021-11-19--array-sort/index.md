---
title: "배열 정렬하기"
tags: ["JS"]
cover: array-sort.png
author: mmyeon
---

## arr.sort() 메서드

- 해당 배열에서 배열 요소를 정렬한 후 리턴함.
- 원본 배열을 변경함.
- 문자열의 유니코드 코드 포인트를 따르기 때문에 숫자 정렬은 따로 작업해줘야 함.

### 문자열이 담긴 배열 정렬하기

```js
let a = ["a", "c", "b", "e"];
a.sort();
console.log(a);
// ['a', 'b', 'c', 'e']
```

### 숫자가 담긴 배열 정렬의 문제점

```js
let a = [1, 11, 2, 30, 111];
a.sort();

console.log(a);
// [1, 11, 111, 2, 30]
```

### 숫자를 비교해서 오름차순 정렬하기

```js
let a = [1, 11, 2, 30, 111];

function compareNumbers(a, b) {
  return a - b;
}
a.sort(compareNumbers);

console.log(a);
// [1, 2, 11, 30, 111]
```

### `compareNumbers함수`는 어떻게 두 숫자를 비교할 수 있을까?

배열의 요소를 비교한 뒤 리턴값을 기준으로 순서 변경함.

- a - b < 0 : b가 a보다 더 크다. 순서 그대로 유지.
- a - b = 0 : a와 b가 같다. 순서 그대로 유지.
- a - b > 0 : a가 b보다 크다. a, b 순서 변경.

---

## 참고

[Array.prototype.sort() - JavaScript | MDN](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/sort)<br>
[[메서드][Array.prototype.sort()]자바스크립트 정렬함수 sort()](https://velog.io/@kim-jaemin420/%EB%A9%94%EC%84%9C%EB%93%9CArray.prototype.sort%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8-%EC%A0%95%EB%A0%AC%ED%95%A8%EC%88%98-sort)<br>
[JavaScript sort() 함수 톺아보기](https://brunch.co.kr/@swimjiy/12)
