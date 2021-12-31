---
title: "react-router-dom 오류 해결하기"
tags: ["REACT"]
cover: solve.jpg
author: mmyeon
---

### 오류가 발생했다.

기존에 만든 프로젝트를 다시 처음부터 만들어보던 중에 라우터 관련해서 오류를 만났다.
익숙한 방식대로 코드를 작성했더니 다음과 같은 오류를 만났다.

`<Routes>` doesn't render non-`<Route>` children

### 문제 해결로 가는 길

해당 오류로 검색을 하자 `react-router-dom`과 관련된 이슈를 찾을 수 있었다.

[React-Router-Dom v6.0.1 이슈](https://velog.io/@sangheon1646/React-Router-Dom-v6.0.1-%EC%9D%B4%EC%8A%88)

내가 설치받은 버전은 ^6.2.1였는데 기존 문법보다 더 strict하게 바뀌었다고 나와있었다.

```js
let theme = {
  /* ... */
};

function MyApp() {
  return (
    <Routes>
      <Route path="/" element={<PageRoute theme={theme} />} />
    </Routes>
  );
}
```

> 깃헙 이슈에 따르면 크게 바뀐 부분이

1. `<Routes/>` 내부에는 오직 `<Route/>`만 사용할 수 있다.
2. 라우팅할 때 보여줄 컴포넌트를 `component={컴포넌트이름}` prop으로 전달했는데 이제는 `element={<컴포넌트 이름/>}`으로 전달해야 된다고 한다.

새로운 문법에 맞춰 작성하려고 하다가
굳이 이 버전을 사용할 필요가 없다는 생각이 들어서 버전을 다운그레이드 하기로 했다.그래서 `npm i react-router-dom@5.2.0`를 입력해 다운그레이드 했다.

그리고 아래와 같이 코드를 작성했다.

```js
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

### 오늘 만난 오류를 통해 배운 점

- 라이브러리 버전으로 인해서 오류가 난 건 처음이라 전혀 예상하지 못했다. 라이브러리 사용 중에 에러가 발생하면 버전이 달라서 생기는 문제일수도 있으니 반드시 버전을 확인해야겠다.
- 예전에 작성된 블로그 글을 보고 참고했더니 버전이 달라서 문제를 해결하는데 도움을 받을 수가 없었다. 문제 발생하면 공식 문서, 깃헙 이슈를 먼저 참고해야겠다!
- 문제를 정의내리고 범위를 좁혀 나가는 연습을 계속 해나가자. 에러 메세지를 더 천천히 읽고 다음 스텝에 대해 생각한 뒤 구글링해야 겠다.

---

### 참고

[리액트 라우터 돔 에러인것같아요](https://codingapple.com/forums/topic/%EB%A6%AC%EC%95%A1%ED%8A%B8-%EB%9D%BC%EC%9A%B0%ED%84%B0-%EB%8F%94-%EC%97%90%EB%9F%AC%EC%9D%B8%EA%B2%83%EA%B0%99%EC%95%84%EC%9A%94/)

[https://github.com/remix-run/react-router/issues/8033](https://github.com/remix-run/react-router/issues/8033)

[https://github.com/remix-run/react-router/issues/8033](https://github.com/remix-run/react-router/issues/8033)
