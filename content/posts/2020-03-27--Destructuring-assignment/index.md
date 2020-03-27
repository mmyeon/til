---
title: 구조 분해 할당
tags: ["JS"]
cover: assignment.jpg
author: mmyeon
---

## 구조 분해 할당이 무엇이지?

배열이나 객체의 속성을 해체하여 그 값을 개별 변수에 담을 수 있게 하는 JS 표현식입니다

---

## 객체 및 배열을 왜 구조 분해 할당을 할까?

즉석에서 쉽게 데이터 뭉치를 만들 수 있다

---

## 배열 구조 분해

```js
const x = [1, 2, 3, 4, 5];
const [x, y] = x;
console.log(x); //1
console.log(y); //2
```

### 기본변수할당

```js
const foo = ["one", "two", "three"];

const [one, two, three] = foo;
console.log(one); // "one"
console.log(two); // "two"
console.log(three); // "three"
```

### 기본값

```js
var a, b;

[a = 5, b = 7] = [1];
console.log(a); // 1
console.log(b); // 7
```

### 변수에 배열의 나머지를 할당하기

```js
var [a, ...b] = [1, 2, 3];
console.log(a); // 1
console.log(b); // [2, 3]
```

### 배열에 새로운 변수 할당

- spread operator과의 차이 : 할당하길 원하는 원소에만 변수 할당 가능

```js
const [a, b] = [1, 2, 3, 4, 5, 6];
console.log(a, b); // 1, 2

const [a, b, , , c] = [1, 2, 3, 4, 5, 6];
console.log(a, b, c); // 1, 2, 5
```

```js
const source = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
function removeFirstTwo(list) {
  "use strict";
  // rest parameter(...)가 있는 구조 분해 할당
  const [a, b, ...arr] = list;
  return arr;
}
const arr = removeFirstTwo(source);
console.log(arr); // [3,4,5,6,7,8,9,10]
console.log(source); // [1,2,3,4,5,6,7,8,9,10];
// 얉은 복사본을 새로운 객체로 반환함
```

---

## 객체 구조 분해

### 새로운 변수 이름으로 할당하기

객체로부터 속성을 해체하여 다른 이름의 변수에 할당할 수 있음.

```js
var o = { p: 42, q: true };
var { p: foo, q: bar } = o;

console.log(foo); // 42
console.log(bar); // true
```

### for of 반복문과 구조분해

```js
var people = [
  {
    name: "Mike Smith",
    family: {
      mother: "Jane Smith",
      father: "Harry Smith",
      sister: "Samantha Smith"
    },
    age: 35
  },
  {
    name: "Tom Jones",
    family: {
      mother: "Norah Jones",
      father: "Richard Jones",
      brother: "Howard Jones"
    },
    age: 25
  }
];

for (var {
  name: n,
  family: { father: f }
} of people) {
  console.log("Name: " + n + ", Father: " + f);
}

// "Name: Mike Smith, Father: Harry Smith"
// "Name: Tom Jones, Father: Richard Jones"
```

### 함수 매개변수로 전달된 객체에서 필드 해체하기

```js
function userId({ id }) {
  return id;
}

function whois({ displayName: displayName, fullName: { firstName: name } }) {
  console.log(displayName + " is " + name);
}

var user = {
  id: 42,
  displayName: "jdoe",
  fullName: {
    firstName: "John",
    lastName: "Doe"
  }
};

console.log("userId: " + userId(user)); // "userId: 42"
whois(user); // "jdoe is John"
```

---

## 내가 만난 비구조화 할당 다시 살펴보기

```js
let a = 8;
let b = 6;

[a, b] = [b, a];

console.log(a); // 6
console.log(b); // 8
```

### 객체의 값 추출하기

```js
const user = { name: "John Doe", age: 34 };

const name = user.name; // name = 'John Doe'
const age = user.age; // age = 34

const { name, age } = user;
```

### 객체에 새로운 변수 할당

- user.name의 값을 얻어 userName이라는 새로운 변수에 할당함

```js
const user = { name: "John Doe", age: 34 };

const { name: userName, age: userAge } = user;
// userName = 'John Doe', userAge = 34
```

```js
const { scrollHeight, clientHeight } = this.box;
/* 비구조화 할당, 같은 코드
const scrollHeight = this.box.scrollHeight;
const clientHeight = this.box.clientHeight;*/
```

```js
const array = [1, 2];
const [one, two] = array;

// const one = array[0]
// const two = array[1]
```

### 객체를 분해해 함수의 인수(argument)로 사용

```js
const stats = {
  max: 56.78,
  standard_deviation: 4.34,
  median: 34.54,
  mode: 23.87,
  min: -0.75,
  average: 35.85
};

const half = ({ max, min }) => (max + min) / 2.0;

console.log(stats); // object
console.log(half(stats)); // 28.015
```

---

## 참고

[구조 분해 할당](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)
