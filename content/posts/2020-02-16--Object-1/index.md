---
title: 객체와 this
tags: ["JS"]
cover: object.jpg
author: mmyeon
---

## 객체

- **서로 연관된 변수와 함수를 그룹핑하고 이름을 붙인 것**
- 이름이 있는 정보를 정리정돈할 때 쓰는 것

---

## 객체 지향 프로그래밍

- 객체를 만드는 공장
- 필요한 걸 찾기 쉬움.
- 펜과 장난감을 각자 보관하면 우리는 펜과 장난감이라는 이름만 기억하면 된다.
- 다시 복잡해지면 정리정돈(역할이 있는 방)을 통해 단순화함.

---

## 객체 추가, 삭제, 업데이트

```js
obj.a;
obj[a];
delete obj.a;
```

---

## 배열과 객체에서의 반복

### 배열에서의 반복

배열은 여러개의 데이터를 가졌기 때문에 반복문과 함께 사용하면 거대한 작업을 할 수 있다.

```js
var memberArray = ["egoing", "graphittie", "leezche"];

console.group("array loop"); // 좀 더 콘솔창에서 보기 좋게함
var i = 0;
while (i < memberArray.length) {
  console.log(i, memberArray[i]);
  i = i + 1;
}
console.groupEnd("array loop");

// array loop
// 0 "egoing"
// 1 "graphittie"
// 2 "leezche"
```

### 객체에서의 반복

객체에서 사용하는 for문은 for-in문이라고 불림

```js
var memberObject = {
  manager: "egoing",
  developer: "graphittie",
  designer: "leezche"
};

console.group("object loop");
for (var name in memberObject) {
  console.log(name, memberObject[name]); //변수이름이라서 대괄호에 넣어야함.
}
console.groupEnd("object loop");

//object loop
// manager egoing
// developer graphittie
// designer leezche
```

## 객체를 언제쓰나

Math라는 객체를 이미 사용해봤다. 객체에 Math라는 이름을 준 것.

```js
Math.PI;
Math.random(); // method : 객체에 소속된 함수
Math.floor(3.9);

var MyMath = {
  PI: Math.PI,
  random: function() {
    //random의 값에 함수를 지정함.
    return Math.random(); // 값을 내림
  },
  floor: function(val) {
    return Math.floor(val);
  }
};

console.log("MyMath.PI", MyMath.PI);
console.log("MyMath.random", MyMath.random());
console.log("MyMath.floor", MyMath.floor(3.9));

// MyMath.PI 3.141592653589793
// MyMath.random 0.248645144406475
// MyMath.floor 3
```

## this

- 메소드 내에서 메소드가 속한 객체를 참조 할 때 사용하는 키워드
- 자기 자신을 가리키는 표현
- 객체는 이미 내부적으로 자기가 무엇을 가지고 있는지 알고 있어서 계속 반복해서 언급할 필요가 없음. **this 사용**.

```js
var kim = {
  name: "kim",
  first: 10,
  second: 20,
  sum: function() {
    return this.first + this.second;
  }
};
//console.log(kim.sum(kim.first,kim.second));
console.log(kim.sum());
```

---

## 참고

[this - JavaScript 객체 지향 프로그래밍](https://www.opentutorials.org/module/4047/24607)

[배열과 객체 - JavaScript 객체 지향 프로그래밍](https://www.opentutorials.org/module/4047/24603)
