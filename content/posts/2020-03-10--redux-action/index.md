---
title: Redux 2 - Redux Action
tags: ["redux"]
cover: state.jpg
author: mmyeon
---

## Redux Action 정의하기

```js
// 액션은 항상 발생한 이벤트에 대한 type을 가지고 있어야함.
const action = { type: "LOGIN" };
```

- 액션 = 발생한 이벤트 액션에 대한 정보를 포함한 자바스크립트 객체

- 리덕스 스토어는 이런 액션 객체를 받은 다음에 스테이트를 업데이트 한다

- 액션은 로그인을 하고 나서 유저이름을 옮기는 액션처럼 때로는 데이터를 옮기기도 한다.

- **리덕스 액션은 앱에서 발생한 이벤트에 대한 정보를 리덕스 스토어에 전달하는 전달자이다.**

- 리덕스 스토어는 발생한 이벤트를 바탕으로 **스테이트를 업데이트 한다**

---

## Action Creator 만들기

- 액션 크리에이터는 액션 이벤트를 나타내는 객체를 만든다.

```js
const action = { type: "LOGIN" };

function actionCreator() {
  return action;
}
```

---

## Action Event 전달하기

```js
// 같은 코드
store.dispatch(actionCreator());
store.dispatch({ type: "LOGIN" });
```

```js
const store = Redux.createStore((state = { login: false }) => state);

const loginAction = () => {
  return {
    type: "LOGIN"
  };
};

store.dispatch(loginAction());
```

- 리덕스 스토어에 액션 전달하기

- store.dispatch()를 호출하면 액션 크리에이터로 리턴된 값인 액션을 다시 스토어로 보낸다

- 액션 크리에이터 호출 → 리턴된 액션 객체(타입 프로퍼티를 가짐, 액션이 발생했다고 구체화해주는)를 리덕스 스토어에 보냄

---

## 스토어에서 Action 다루기

- reducer 함수 등장!!

- 액션이 만들어져서 보내진 후에 리덕스 스토어는 액션에 어떻게 반응할까? (reducer 함수)

- reducer함수는 단순히 스테이트와 액션을 가져가서 **새로운 스테이트를 리턴함**

- 리덕스에서 스테이트는 오직 읽기만 가능함. 그래서 reducer도 스테이트의 새로운 카피를 리턴하기 때문에 스테이트를 직접적으로 수정하지 않음

```js
const defaultState = {
  login: false
};

const reducer = (state = defaultState, action) => {
  if (action.type === "LOGIN") {
    return {
      login: true
    };
  } else {
    return state;
  }
};

const store = Redux.createStore(reducer);

const loginAction = () => {
  return {
    type: "LOGIN"
  };
};
```

---

## 여러 액션을 핸들하기 위해 Switch문 사용하기

- 유저가 로그인하고 로그아웃할 때 스테이트를 알려주기 (프로퍼티를 가진 하나의 스테이트 오브젝트)
- 로그인, 로그아웃과 연관된 액션을 만드는 액션 크리에이터가 필요함

- reduce()는 **현재의 스테이트를 리턴**하는 게 중요하다. 그래야 reducer랑 관련있는 액션만 알아차림.

```js
const defaultState = {
  authenticated: false
};

const authReducer = (state = defaultState, action) => {
  switch (action.type) {
    case "LOGIN":
      return {
        authenticated: true
      };
    case "LOGOUT":
      return {
        authenticated: false
      };
    default:
      return defaultState;
  }
};

const store = Redux.createStore(authReducer); // 스테이트 업데이트

const loginUser = () => {
  return {
    type: "LOGIN"
  };
};

const logoutUser = () => {
  return {
    type: "LOGOUT"
  };
};
```

---

## Action Types를 위해 const 사용하기

- const에 오직 읽기만 가능한 액션타입을 할당하기

- 액션타입과 Switch문에서 변수 사용

- 같은 const 참조하기 때문에 스펠링 실수 줄일 수 있다.

```js
const LOGIN = "LOGIN";
const LOGOUT = "LOGOUT";

const defaultState = {
  authenticated: false
};

const authReducer = (state = defaultState, action) => {
  switch (action.type) {
    case LOGIN:
      return {
        authenticated: true
      };

    case LOGOUT:
      return {
        authenticated: false
      };

    default:
      return state;
  }
};

const store = Redux.createStore(authReducer);

const loginUser = () => {
  return {
    type: LOGIN
  };
};

const logoutUser = () => {
  return {
    type: LOGOUT
  };
};
```
