---
title: "리스트와 Key"
tags: ["REACT"]
cover: solve.jpg
author: mmyeon
---

### 리스트를 반복할 때 왜 Key가 중요한가

- 리액트가 어떤 항목이 변경되었는지 알아내는 데 Key가 필요하다.
- 배열 엘리먼트에 Key를 부여하면 엘리먼트가 고유성을 갖게 된다.

### Key가 있을 때와 없을 때의 동작 차이

- Key가 없을 때는 Virtual DOM을 비교하는 과정에서 리스트를 하나하나 비교하면서 변화를 감지한다. 그 리스트가 천 개라면 천 개를 모두 확인하게 된다.
- Key가 있다면 리액트가 Key 값을 사용해서 어떤 부분이 바뀌었는지 더 빠르게 찾을 수 있다.

### 리액트가 추천하는 Key

- 다른 리스트들 사이에서 해당 항목을 고유하게 ‘식별’할 수 있는 문자열 사용하는 것이 좋다.
- 예시 : 데이터의 ID

### Key의 특징

- 고유해야 한다.
- 고유한 값이 없을 경우에는 배열의 index를 사용할 수 있다. 다만 요소 순서가 바뀌는 경우에 index 사용하면 효율적으로 리렌더링을 하지 못한다.
- 배열 안에서 형재 사이에서만 고유한 값이면 된다. 전체 범위에서 고유할 필요가 없다.

```jsx
function Blog(props) {
  const sidebar = (
    <ul>
      {props.posts.map(post => (
        <li key={post.id}>{post.title}</li>
      ))}
    </ul>
  );
  const content = props.posts.map(post => (
    <div key={post.id}>
      <h3>{post.title}</h3>
      <p>{post.content}</p>
    </div>
  ));
  return (
    <div>
      {sidebar}
      <hr />
      {content}
    </div>
  );
}

const posts = [
  { id: 1, title: "Hello World", content: "Welcome to learning React!" },
  { id: 2, title: "Installation", content: "You can install React from npm." }
];
ReactDOM.render(<Blog posts={posts} />, document.getElementById("root"));
```

---

### 참고

[리스트와 Key - React](https://ko.reactjs.org/docs/lists-and-keys.html)

책 - 리액트를 다루는 기술
