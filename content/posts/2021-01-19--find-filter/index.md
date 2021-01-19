---
title: "find메서드와 filter메서드의 차이"
tags: ["JS"]
cover: til.jpg
author: mmyeon
---

## 원하는 값을 찾고 싶다면?

`find()`
`filter()`

## 두 메서드의 차이점

`filter()`는 테스트를 통과하는 요소를 담은 <b>새로운 배열</b>을 리턴하고, `find()`는 테스트 조건에 맞는 요소 중 <b>첫 번째 요소의 값</b>를 리턴한다.

```js
const foods = [{ name: "떡볶이", taste: "spicy" }, { name: "호떡", taste: "sweet" }];

foods.find(food => food.name === "호떡");
// {name: "호떡", taste: "sweet"}

foods.filter(food => food.name === "호떡");
// [{name: "호떡", taste: "sweet"}]
```

```js
const toDo = finishedList.filter(toDo => toDo.id === id);
pendingList.push(...toDo);

const toDo = finishedList.find(toDo => toDo.id === id);
pendingList.push(toDo);
```

---

### 참고

[Array.prototype.filter()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)<br>
[Difference between find and filter](https://stackoverflow.com/questions/2438223/difference-between-find-and-filter/14846148)<br>
