---
title: "[React Hook] UseState"
tags: ["React"]
cover: hook.jpg
author: mmyeon
---

## useState Hook 함수

- Class없이 상태 값과 여러 리액트 기능 사용 가능함
- 리액트는 해당 변수를 리렌더링할 때 기억하고, 가장 최근에 갱신된 값을 제공함
  count 변수의 값을 갱신하려면 setCount를 호출하면 됨.
- useState Hook을 이용하면 state변수와 해당 state를 갱신할 수 있는 함수가 만들어짐
- useState의 인자의 값으로 0을 넘겨주면 count값을 0으로 초기화할 수 있음
- 리액트는 새로운 count 변수를 Example 컴포넌트에 넘기며 해당 컴포넌트를 리렌더링함

## 함수형 컴포넌트 코드 살펴보기

```js
// useState Hook을 React에서 가져오기
import React, { useState } from "react";

function Example() {
  // 새로운 state 변수를 선언하고, 이것을 count라 부름.
  // state 변수와
  const [count, setCount] = useState(0);

  return (
    <div>
      <p> You clicked {count} times </p>
      // 사용자가 버튼을 클릭하면 setCount 함수 호출하여 state 변수 갱신
      <button onClick={() => setCount(count + 1)}>Click me</button>
    </div>
  );
}
```

---

## Hook과 같은 기능을 하는 클래스 컴포넌트

- state는 `{ count : 0}`
- 사용자가 this.setState()를 호출하는 버튼을 클릭했을 때 state.count 증가시킴

## 클래스 컴포넌트 코드 살펴보기

```js
class Example extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      count: 0
    };
  }

  render() {
    return (
      <div>
        <p> You clicked {this.state.count} times </p>
        <button onClick={() => this.setState({ count: this.state.count + 1 })}>Click me</button>
      </div>
    );
  }
}
```

---

## 클래스 컴포넌트와 함수형 컴포넌트 비교하기

### state 가져오기

**클래스 컴포넌트** : count를 보여주기 위해서 `this.state.count` 사용

```js
<p> You clicked {this.state.count} time </p>
```

**함수 컴포넌트** : `count` 직접 사용

```js
<p> You clicked {count} time </p>
```

### state 갱신하기

**클래스 컴포넌트** : `count`를 갱신하기 위해서 `this.setState()` 호출

```js
<button onClick={() => this.setCount({count : this.state.count + 1})}>
```

**함수 컴포넌트** : `setCount`와 `count` 변수를 가지고 있으므로 `this`를 호출하지 않아도 됨

```js
<button onClick={() => setCount(count + 1)}>Click me</button>
```
