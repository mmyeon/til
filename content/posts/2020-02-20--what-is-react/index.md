---
title: 리액트 시작하기
tags: ["REACT"]
cover: what-is-react.jpg
author: mmyeon
---

## 리액트 개발서버 시작하기.

> npm start

- localhost를 계속 유지하려면 npm start를 실행하고 console을 유지해야한다.

---

## 리액트는 무엇일까?

- 리액트는 자바스크립트와 함께 코드를 만들어서 HTML에 넣는 역할을 한다.

- 모든 리액트 어플리케이션을 엘레먼트 안에 넣음.

- 소스코드에서는 기본적으로 빈 index.js파일만 보인다.

- react는 소스코드를 처음부터 html에 넣지 않고 html에서 추가하거나 제거하는 법을 알고 있다.

- 어플리케이션이 로드할 때 빈 html을 로드하고 리액트가 푸쉬한다.

- virtual DOM 소스코드에는 존재하지 않는 걸 리액트가 만들어 낸다. 그래서 리액트가 빠르다

---

## 컴포넌트와 JSX

### 리액트는 모두 컴포넌트다.

- **컴포넌트** = HTML을 반환하는 함수

```js
<App />
```

### 자바스크립트 + HTML 사이의 조합= JSX

---

## 리액트 작성방법

- src에 파일 만들기 예시\) Potato.js

- 컴포넌트 만들때마다 import React from "react"; 작성

```js
    import React from "react";

    function Potato(){
    	return <h3>I love potato</h3>;
    }

    exexport default Potato;
```

---

## 단 하나의 컴포넌트

- 리액트 어플리케이션은 하나의 컴포넌트만 렌더링할 수 있다.

- 따라서 모든 것은 어플리케이션 안으로 들어가야 한다.
- 컴포넌트 안에 컴포넌트 컴포넌트

```js
import React from "react";
import Potato from "./Potato";
// 같은 디렉토리에 있음(./)

function App() {
  return (
    <div>
      <h1>Hello</h1>
      <Potato />
    </div>
  );
}

export default App;
```

---

## 다시 사용할 수 있는 컴포넌트 with JSX + Props

```js
import React from "react";

function Potato() {
  return <h1>I like potato</h1>;
}

function App() {
  return (
    <div>
      <h1>Hello</h1>
      <Potato />
    </div>
  );
}

export default App;
```
