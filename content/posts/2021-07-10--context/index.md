---
title: "React Context API 사용하기"
tags: ["REACT"]
cover: context.png
author: mmyeon
---

## 왜 Context API를 공부헀는가

<b>YOGALIM 요가수련 프로젝트</b>에서 통증 점수를 리뷰 컴포넌트에서 알아야 하기 때문에 `props`가 아닌 React Context API를 사용할 필요성을 느껴서 공부했다.

## props가 있는데 왜 Context API를 사용해야 하는가?

### props의 한계

리액트에서 다른 컴포넌트로부터 데이터를 전달 받을 때 `props`를 사용한다. `props`는 자신의 바로 위에 있는 컴포넌트로부터 직접 전달받아야 한다는 한계가 있다. 만약 컴포넌트 depth가 깊다면 중간에 있는 컴포넌트들은 값이 필요하지도 않으면서 `props`를 사용해서 하위 컴포넌트에 계속 전달해야 한다.

### 그렇다면 어떻게 이 문제를 해결할 수 있을까?

리액트가 SPA이기 때문에 항상 최상위 컴포넌트가 있다는 사실을 활용하면 된다. 리액트 폴더 어딘가에 `context` 객체라는 상자를 만들어 놓고, 다른 컴포넌트에게 전달하고 싶은 데이터를 `context` 내부에 넣어놓으면 된다. 만약 `context` 안에 있는 데이터를 사용하고 싶다면, 해당 컴포넌트는 `context`와 연결해서 데이터에 접근할 수 있는 권한을 부여받으면 된다. 상위 컴포넌트가 데이터의 권한을 부여받았으면 자기자신을 포함한 하위 모든 컴포넌트는 `context` 내부에 있는 데이터에 직접 접근할 수 있다. 따라서 하위 컴포넌트는 별도의 작업 없이 `context`에 있는 값을 편하게 사용할 수 있다.

## context 사용 순서

### 유저 데이터가 담긴 context를 만들어보자!

1. store/users.js 파일 내부에 context 만들기

```jsx
const UserContext = createContext();
```

2. 만들어진 context 객체에 넣고싶은 데이터 적어주기

```jsx
const users = {
  name: "yongsil",
  job: "FE"
};
```

3. Context.Provider 리턴하기
   value값으로 전달하고 싶은 데이터 입력하기<br>
   하위 컴포넌트를 렌더링 해주기 위해서 `props.children` 사용

```jsx
<UserContext.Provider value={users}>{props.children}</UserContext.Provider>
```

4. 특정한 컴포넌트와 컨텍스트로 감싸줘서 컨텍스트와 컴포넌트 연결해주기

```js
<UserStore>
  <Router>
    <Route path="/about">
      <About/><Route>
    </Router>
</UserStore>
```

5. 컨텍스트 데이터 불러와서 사용하기

- 데이터 객체를 리턴함

```js
// UseContext(컨텍스트 이름 넣어주기)
useContext(MyContext);
```

### 전체 예시

```js
const themes = {
  light: {
    foreground: "#000000",
    background: "#eeeeee"
  },
  dark: {
    foreground: "#ffffff",
    background: "#222222"
  }
};

const ThemeContext = React.createContext(themes.light);

function App() {
  return (
    <ThemeContext.Provider value={themes.dark}>
      <Toolbar />
    </ThemeContext.Provider>
  );
}

function Toolbar(props) {
  return (
    <div>
      <ThemedButton />
    </div>
  );
}

function ThemedButton() {
  const theme = useContext(ThemeContext);
  return (
    <button style={{ background: theme.background, color: theme.foreground }}>
      I am styled by theme context!
    </button>
  );
}
```

---

## 참고

[https://www.youtube.com/watch?v=sqz45pnvJHg](https://www.youtube.com/watch?v=sqz45pnvJHg)

[Hooks API Reference - React](https://ko.reactjs.org/docs/hooks-reference.html#usecontext)
