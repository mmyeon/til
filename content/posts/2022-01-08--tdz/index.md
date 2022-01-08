---
title: "Temporal Dead Zone (TDZ)"
tags: ["JS"]
cover: solve.jpg
author: mmyeon
---

# Temporal Dead Zone에 대하여

- TDZ존은 선언 되기 전에 변수에 접근하는 걸 금지한다.
- 선언되지 않은 변수(TDZ존에 있는 변수)에 접근할 때 자바스크립트는 선언되기 전에는 접근할 수 없다는 ReferenceError를 던진다.

```jsx
white; // throws `ReferenceError`
const white = "#FFFFFF";
white;
```

- `const white = '#FFFFFF'` 문에 도달하기 전까지 변수 `white`는 TDZ 존에 있다.

---

<br>

# TDZ에 영향을 받는 구문들

- const 변수
- let 변수
- 클래스 구문

```jsx
// Does not work!
const myNissan = new Car("red"); // throws `ReferenceError`

class Car {
  constructor(color) {
    this.color = color;
  }
}
```

- `constructor()` 내부에 있는 `super()`
  - `constructor()` 내부의 `this`는 `super()`가 호출될 때까지 사용할 수 없다.
  - 인스턴스를 초기화하기 위해서 부모의 `constructor`를 호출하고, 그 뒤에 인스턴스가 준비 되면 자식의 `constructor` 내부에서 수정할 수 있다.

```jsx
class MuscleCar extends Car {
  constructor(color, power) {
    this.power = power;
    super(color);
  }
}
// Does not work!
const myCar = new MuscleCar("blue", "300HP"); // `ReferenceError`
```

- 함수의 default 파라미터
  - default 파라미터는 함수 스코프와 글로벌 스코프의 중간 스코프에 해당하므로 TDZ 제한을 따른다.
  ```jsx
  const a = 2;
  function square(a = a) {
    // a가 선언되기 전에 사용됨.
    return a * a;
  }
  // Does not work!
  square(); // throws `ReferenceError`
  ```

# TDZ에 영향을 받지 않는 구문들 = 호이스팅 되는 경우

- var

```jsx
// Works, but don't do this!
value; // => undefined
var value;
```

- function 선언문
- import 구문

```jsx
// Works!
myFunction();
import { myFunction } from "./myModule";
```

---

<br>

# 참고

<br>

[Don't Use JavaScript Variables Without Knowing Temporal Dead Zone](https://dmitripavlutin.com/javascript-variables-and-temporal-dead-zone/)

[TDZ을 모른 채 자바스크립트 변수를 사용하지 말라](https://ui.toast.com/weekly-pick/ko_20191014)
