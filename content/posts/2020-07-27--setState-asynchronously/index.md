---
title: setState()에서 함수를 쓰는 이유
tags: ["React"]
cover: setstate.jpg
author: mmyeon
---

### setState()로 스테이트 업데이트하기
컴포넌트의 로컬 스테이트를 업데이트 하기 위해서 스테이트를 직접 변경하지 않고 `this.setState()`를 사용한다. 
`this.setState`를 호출하면 리액트는 스테이트가 바뀌었다는 걸 알고 render메서드를 다시 호출한다.
리랜더링으로 DOM을 업데이트해서 스크린에 보여준다. 

### 문제는 스테이트 업데이트가 우리가 원하는 시점에 일어나지 않는다는 것이다. 
`this.setState`를 호출할 때 DOM에 바로 업데이트가 되지 않고 <b>비동기적으로 발생하기 때문에</b> 
다음 스테이트를 계산할 때 현재의 스테이트에 의존하게 되면 원하는 결과를 얻을 수 없다.

이런 문제를 해결하기 위한 방법이 있다.<br>
바로 setState의 인자로 함수를 전달하는 것이다. 

```js
// Wrong
// 다음 스테이트를 구하기 위해 현재의 스테이트 값에 의존했다. 
this.setState({
  counter: this.state.counter + this.props.increment,
});


// Correct
// 객체대신 함수를 사용하면 컴포넌트의 state와 props에 대해 신뢰할 수 있는 값을 얻게 된다 
this.setState((state, props) => ({
  counter: state.counter + props.increment
})); 
```

### 결론
컴포넌트를 업데이트 하기 위해 setState를 사용해야하고,  
다음 스테이트를 계산하기 위해 컨포넌트의 current state와 current props가 필요하다면?
this.setState의 첫번째 파라미터로 객체 대신에 함수를 전달하라



---

### 참고

[Using a function in setState instead of an object](https://medium.com/@wisecobbler/using-a-function-in-setstate-instead-of-an-object-1f5cfd6e55d1)
[리액트 공식문서](https://reactjs.org/docs/state-and-lifecycle.html#state-updates-may-be-asynchronous)
