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

- 액션은 발생한 이벤트 액션에 대한 정보를 포함한 자바스크립트 객체이다

- 리덕스 스토어는 이런 액션 객체를 받은 다음에(dispatch) 스테이트를 업데이트 한다

  - 때로는 데이터를 옮기기도 한다. 로그인을 하고 나서 유저이름을 옮기는 액션처럼

- 다시 말하자면, 리덕스 액션은 앱에서 발생한 이벤트에 대한 정보를 리덕스 스토어에 전달하는 전달자이다.
  리덕스 스토어는 발생한 이벤트를 바탕으로 **스테이트를 업데이트 한다**

---

## Action Creator 만들기

- 액션 크리에이터는 액션 이벤트를 나타내는 객체를 만든다.

```js
const action = {
  type: "LOGIN"
};

function actionCreator() {
  return action;
}
```

---

## Action Event 전달하기

- 예시
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

- store.dispatch() 호출하고 액션 크리에이터로 리턴된 값을 전달하면 액션을 다시 스토어로 보낸다

- 액션 크리에이터 호출 → 리턴된 액션 객체(타입 프로퍼티를 가짐, 액션이 발생했다고 구체화해주는)를 리덕스 스토어에 보냄

---

### Handle an Action in the Store

액션이 만들어져서 보내진 후에 리덕스 스토어는 액션에 어떻게 반응할지 알아야 한다 (reducer 함수)

reducer함수는 단순히 스테이트와 액션을 가져가서 새로운 스테이트를 리턴함.

리덕스에서 스테이트는 오직 읽기만 가능함

그래서 reducer도 스테이트의 새로운 카피를 리턴해서 스테이트를 직접적으로 수정하지 않음

    const defaultState = {
      login: false
    };

    const reducer = (state = defaultState, action) => {
      // change code below this line
      if(action.type === "LOGIN"){
        return {
          login : true
          };
      } else {
        return state;}
      // change code above this line
    };

    const store = Redux.createStore(reducer);

    const loginAction = () => {
      return {
        type: 'LOGIN'
      }
    };

### Use a Switch Statement to Handle Multiple Actions

리덕스 스토어에 많은 액션 타입을 다루는 방법을 말해주기

1. 유저가 로그인하고 로그아웃할 때 스테이트를 알려주는 게 필요(프로퍼티를 가진 하나의 스테이트 오브젝트)
2. 로그인, 로그아웃과 연관된 액션을 만드는 액션 크리에이터가 필요하다

reduce()는 현재의 스테이트를 리턴하는 게 중요하다. 그래야 리듀서랑 관련있는 액션만 알아차림

    const defaultState = {
      authenticated: false
    };

    const authReducer = (state = defaultState, action) => {
      // change code below this line
      switch (action.type){
        case "LOGIN" :
         return {
          authenticated : true
        }
        case "LOGOUT" :
         return {
          authenticated : false
        };
        default :
         return defaultState;
    }
    // change code above this line
    };

    const store = Redux.createStore(authReducer); // 스테이트 업데이트

    const loginUser = () => {
      return {
        type: 'LOGIN'
      }
    };

    const logoutUser = () => {
      return {
        type: 'LOGOUT'
      }
    };

### Use const for Action Types

액션타입을 오직 읽을 수 만 있는 콘스트에 할당하기(사용될때마다 상수 참고하기)

액션타입과 스위치문에서 변수사용

같은 콘스트 참조하기 때문에 스펠링 오류에서 벗어날 수 있다.

    // change code below this line
    const LOGIN = "LOGIN";
    const LOGOUT = "LOGOUT"
    // change code above this line

    const defaultState = {
      authenticated: false
    };

    const authReducer = (state = defaultState, action) => {

      switch (action.type) {

        case LOGIN:
          return {
            authenticated: true
          }

        case LOGOUT:
          return {
            authenticated: false
          }

        default:
          return state;

      }

    };

    const store = Redux.createStore(authReducer);

    const loginUser = () => {
      return {
        type: LOGIN
      }
    };

    const logoutUser = () => {
      return {
        type: LOGOUT
      }
    };
