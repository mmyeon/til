---
title: Redux 1 - Redux Store
tags: ["Redux"]
cover: state.jpg
author: mmyeon
---

## Redux

1. 자바스크립트 앱을 위한 예측가능한 스테이트 컨테이너
2. 클라이언트, 서버, 네이티브의 다양한 환경에서 작동함
3. 테스트 하기 쉬움
4. 어떤 라이브러리에서도 사용할 수 있음

---

## Redux Store 만들기

- 리덕스는 state 관리 프레임워크
- 어플리케이션의 전체 state를 책임지는 단일의 state 객체
- React app에 10개의 컴포넌트가 존재하고, 각 컴포넌트는 각자의 로컬 state를 가지고 있다면 **앱의 전체 state는 Redux Store에 싱글 스테이트 오브젝트로 정의된다.**
- **따라서 스테이트를 업데이트하려면 리덕스 스토어를 걸쳐야 한다**

```js
const reducer = (state = 5) => {
  return state;
};

// 리덕스 메서드는 리덕스 객체로부터 사용가능하다.
// 스토어 정의하기
const store = Redux.createStore(reducer);
```

---

## Redux Store에서 스테이트 얻기

- 리덕스 스토어 객체랑 상호작용하기

```js
const store = Redux.createStore((state = 5) => state);

const currentState = store.getState();
```

---
