---
title: "타입 다루기"
tags: ["Clean Code"]
cover: solve.jpg
author: mmyeon
---

# 원시값과 참조값에 맞춰 타입 검사하기

- typeof : 타입검사해서 문자열로 반환함

  ```jsx
  typeof null; // object
  typeof false; // boolean
  typeof NaN; // number
  ```

- instanceof

  ```jsx
  function Person(name, age) {
    this.name = name;
    this.age = age;
  }

  const yeon = new Person("yeon", 20);

  yeon instanceof Person; // true
  ```

- 더 정확한 타입을 검사하고 싶다면

  ```jsx
  const arr = [];
  const func = function() {};
  const date = new Date();

  arr instanceof Object; // true
  func instanceof Object; // true
  date instanceof Object; // true

  Object.prototype.toString.call(date); // '[object Date]'
  ```

---

<br>

# Number.isNaN() 사용하기

- NaN : 다른 모든 값과 비교했을 때 다르고, 다른 NaN과 비교했을 때도 같지 않다.
- Number.isNaN()의 값이 false면 입력받은 값이 숫자라는 의미!
- Number.isNaN과 isNaN은 다르다
- **isNaN은 느슨한 검사를 하고, Number.isNaN은 엄격한 검사를 한다.**

```jsx
isNaN(123 + “테스트”) // true
Number.isNaN(123 + “테스트”)  // false

```

---

<br>

# undefined & null

```jsx
// !뒤에 값을 불리언으로 평가한 뒤 값 뒤집기
!null; // true

// !!는 Boolean()과 동일하다
!!null; // false

// 수학연산에서 0으로 취급
null + 123; // 123

// 값이 달라서 false
null == false; // false

// !가 붙으면 뒤의 값을 불리언으로 평가한 뒤 반대값 반환
!null === true; // true

undefined + 10; // NaN

undefined == null; //true

// undefined의 타입("undefined"), null의 타입("object")
undefined === null; // false

!undefined === !null; // true
```

### falsy값

- false
- null
- undefined
- 0
- -0
- 0n
- NaN
- “”

### 실천 방법

- 비어있는 값은 항상 null로 정의하기
- undefined, null → 값이 없거나 정의되지 않음
- 연산에서 null은 0에 가깝고 undefined는 NaN을 의미한다.

---

<br>

# 엄격 동등 연산자(===)를 사용하기

- 동등연산자는 의도하지 않은 암묵적인 형 변환까지 일으킨다.

---

<br>

# 암묵적인 형변환은 No! 명시적으로 하기

- 자바스크립트 엔진 평가 -> 암묵적인 형변환
- 사용자 → 명시적인 형변환

```jsx
// 암묵적인 형변환
11 + " 문자와 결합"; // '11 문자와 결합'

!!"문자열"; // true
!!""; // false

// 명시적인 형변환
String(11 + " 문자와 결합");

Boolean("문자열"); // true
Boolean(""); // false

parseInt("9.9999", 10); // 9
```

- parseInt()는 꼭 특정 진수 넣어주기

---

## 참고

[클린코드 자바스크립트](https://www.udemy.com/course/clean-code-js/)
