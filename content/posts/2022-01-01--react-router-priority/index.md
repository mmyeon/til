---
title: "react-router의 우선순위"
tags: ["REACT"]
cover: solve.jpg
author: mmyeon
---

### react-router의 우선순위

라우팅할 때 `Router 컴포넌트`의 자식 컴포넌트의 path를 순서대로 확인해서 해당 path가 같으면 `Route 컴포넌트`에 입력된 컴포넌트를 화면에 보여준다.

### Switch 컴포넌트

Switch 컴포넌트의 역할은 하위 `Route컴포넌트` 중에서 매칭하는 컴포넌트 중에서 하나만 출력해준다.

### BrouwserRouter 컴포넌트

웹 애플리케이션에 HTML5의 `History API`를 사용하여 페이지를 새로고침하지 않고도 주소를 변경하고, 현재 주소에 관련된 정보를 props로 쉽게 조회하거나 사용할 수 있게 해준다.

### 코드

```jsx
import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "./routes/Home";
import Result from "./routes/Result";
import Quiz from "./routes/Quiz";
import PageNotFound from "./routes/PageNotFound";

const DefaultRouter = () => {
  return (
    <Router>
      <Switch>
        <Route path="/" exact component={Home} />
        <Route path="/quiz/:1" exact component={Quiz} />
        <Route path="/result" exact component={Result} />
        <Route path="*" component={PageNotFound} />
      </Switch>
    </Router>
  );
};

export default DefaultRouter;
```

---

### 참고

[hooks와 react-router의 중첩 Route와 404 페이지 설정하기 - YOOGOMJA 개발 블로그](https://yoogomja.github.io/2020/04/29/reactjs-nested-route-404/)
