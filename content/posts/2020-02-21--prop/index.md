---
title: prop
tags: ["react"]
cover: info.jpg
author: mmyeon
---

## prop

- 부모 컴포넌트 정보를 어떻게 자식 컴포넌트에게 줄 것인가
- 컴포넌트 반복해서 다시 사용하기

```js
//Food 컴포넌트에 정보를 보내는 방법 : <컴포넌트 컴포넌트의 프로퍼티(prop) = value/>
<Food name="kimchi" />
```

- refresh해도 브라우저에 아무런 변화가 없다면, 정보를 주기만 하고 그 정보를 사용하지 않았기 떄문이다.

---

## prop 사용하기

```js
import React from "react";

//prop과 value로 컴포넌트에 정보를 보내면 리액트는 함수 컴포넌트의 인자(argument)로 프로퍼티를 넣는다.
function Food(props) {
  console.log(props);
  return <h1>I like potato</h1>;
}

function App() {
  return (
    <div>
      <h1>Hello </h1>
      <Food fav="kimchi" something={true} papapapa={["hello", 1, 2, 3, 4, 5]} />
    </div>
  );
}

export default App;
```

```js
//props라고 불리는 argument의 내부, 객체로 나옴
// {fav: "kimchi", something: true, papapapa: Array(6)}
fav: "kimchi";
papapapa: (6)[("hello", 1, 2, 3, 4, 5)];
something: true;
__proto__: Object;
```

---

## JSK+컴포넌트

```js
{
  fav: "kimchi";
}
// object를 열어서  object에서 fav를 꺼냄
props.fav = { fav } = kimchi;
```

```js
import React from "react";

//argument로 들어가는 fav(prop)는 부모가 준 것!
function Food({ fav }) {
  return <h1>I like {fav}</h1>;
}

function App() {
  return (
    <div>
      <h1>Hello</h1>
      <Food fav="kimchi" />
      <Food fav="ramen" />
      <Food fav="sundae" />
      <Food fav="rice cake" />
    </div>
  );
}

export default App;
```

---

## 정리합시다

- JSX = HTML + Javascript

- 컴포넌트는 대문자로 시작한다 \<Food />

- 컴포넌트로 정보를 보낼 수 있다.
  - father가 children에게 data를 어떻게 보낼까?
  - App이 어떻게 Food에게 props를 사용해서 data를 보낼까
- rendering : 서버에서 파일을 받아 브라우저에 뿌려주는 과정

---

## Dynamic Component Generation

- 음식이 20개라면 다 복사붙여넣기 해야할까?
- 처음부터 데이터를 가지고 있지 않아서 복사붙여넣기를 할 수 없다면?
- 웹사이트에 동적으로 데이터 추가하기 → 함수만들기

```js
const foodILike = [];
// food의 오브젝트의 배열이 됨

array.map();
// array → array로 줌
```

- 리액트에서 {}쓰면 자바스크립트임.

  ### 다이나믹한 컴포넌트 만들기

1. 컴포넌트 만들고
2. 컴포넌트에 전달할 정보 넣고 {프로퍼티 : 값}
3. 사용하기 {} 자바스크립트

```js
import React from "react";

const foodILike = [
  {
    id: 1,
    name: "Kimchi",
    image:
      "http://aeriskitchen.com/wp-content/uploads/2008/09/kimchi_bokkeumbap_02-.jpg"
  },
  {
    id: 2,
    name: "Samgyeopsal",
    image:
      "https://3.bp.blogspot.com/-hKwIBxIVcQw/WfsewX3fhJI/AAAAAAAAALk/yHxnxFXcfx4ZKSfHS_RQNKjw3bAC03AnACLcBGAs/s400/DSC07624.jpg"
  },
  {
    id: 3,
    name: "Bibimbap",
    image:
      "http://cdn-image.myrecipes.com/sites/default/files/styles/4_3_horizontal_-_1200x900/public/image/recipes/ck/12/03/bibimbop-ck-x.jpg?itok=RoXlp6Xb"
  },
  {
    id: 4,
    name: "Doncasu",
    image:
      "https://s3-media3.fl.yelpcdn.com/bphoto/7F9eTTQ_yxaWIRytAu5feA/ls.jpg"
  },
  {
    id: 5,
    name: "Kimbap",
    image:
      "http://cdn2.koreanbapsang.com/wp-content/uploads/2012/05/DSC_1238r-e1454170512295.jpg"
  }
];

function Food({ name, picture }) {
  return (
    <div>
      <h2>I like {name}</h2>
      <img src={picture} alt={name} />
    </div>
  );
}

function App() {
  return (
    <div>
      {foodILike.map(dish => (
        <Food key={dish.id} name={dish.name} picture={dish.image} />
      ))}
    </div>
  );
export default App;
```

---

## KEY

- 리액트의 모든 요소는 다르게 보여야 한다. 리액트는 이름과 사진이 달라도 구조가 같으면 같다고 인식. 그런 리액트를 위한 작업이 필요(유니크하도록 key 추가)
- react 내부를 위한 작업임. key prop은 자식 컴포넌트로 전달되지 않음. 사용하지 않음

```js
key = {dish.id}
```

---

## 참고

[ReactJS로 웹 서비스 만들기](https://academy.nomadcoders.co/courses/enrolled/216871)
