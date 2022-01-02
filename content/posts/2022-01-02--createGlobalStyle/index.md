---
title: "React에 글로벌 스타일 적용하기"
tags: ["REACT"]
cover: solve.jpg
author: mmyeon
---

### 글로벌 스타일을 적용하는 스타일드 컴포넌트를 만드는 방법

`createGlobalStyle` 사용하면 된다.

### 일반 스타일드 컴포넌트와 다른 점은?

일반 스타일드 컴포넌트는 스코프를 로컬 CSS 클래스에 자동적으로 제한하기 때문에 다른 컴포넌트와 분리될 수 있는 반면에 `createGlobalStyle`을 사용하면 그 제한이 제거되면서 스타일이 글로벌하게 적용될 수 있다.

### 삽입 위치

리액트 트리의 상단에 GlobalStyle을 넣어두면 컴포넌트가 렌더될 때 글로벌 스타일이 적용된다.

### 코드

```jsx
// GlobalStyle.js

import { createGlobalStyle } from "styled-components";

const GlobalStyle = createGlobalStyle`
*, *::before, *::after {
    box-sizing: border-box;
    margin:0;
    padding:0;
  }

  body {
    font-family: "Helvetica", "Arial", sans-serif;
    line-height: 1.5;
    
  }
`;

export default GlobalStyle;
```

```js
//App.js

import React from "react";
import Router from "./Router";
import GlobalStyles from "./GlobalStyles";

const App = () => {
  return (
    <>
      <Router />
      <GlobalStyles />
    </>
  );
};

export default App;
```
