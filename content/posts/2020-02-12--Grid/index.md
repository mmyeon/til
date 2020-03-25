---
title: Flexbox와 Grid
tags: ["CSS"]
cover: grid.jpg
author: mmyeon
---

### Flex

```html
<body>
  <div class="container">
    <div class="item">
      <p>Flex</p>
      <p></p>
      <p>Grid</p>
      <p></p>
    </div>
  </div>
</body>
```

```css
/* flex */
.container {
  display: flex;
  flex-direction: row; /* 기본값이 row (가로) */
  flex-wrap: nowrap; /* 컨테이너가 아이템의 폭보다 더 줄어들 때 어떻게 할지 나타내는 기능, nowrap이 기본값 */
  justify-content: center; /* 현재의 축 방향으로 정렬, 오뎅꼬치라고 생각하고 가로 정렬 */
  align-items: center; /* 현재의 축 반대방향으로 정렬, 기본값이 stretch */
  align-content: flex-start; /* flex-warp이 wrap인 경우 사용가능, 컨텐츠가 stretch되지 않고 위에 붙음 */
}

.item {
  flex-grow: 1; /* 빈 공간없이 신축성있게 움직임. width가 아닌 여백을 얼만큼의 비율로 늘어나게 할 것인가. */
  flex-basis: 0; /* width 비율로 늘어나게 함, 기본값 auto */
  flex: 1; /* 줄어들 때 비율, flex-shrink의 축약형 */
}

.item:nth-child(1) {
  flex: 1; /* 해당요소만 기능적용.  */
  order: 2; /* 순서지정 */
}

.item:nth-child(2) {
  align-self: center; /* 각각 정렬 */
  order: 1;
}
```

---

### Grid

```html
<body>
  <div class="container">
    <p>Flex</p>
    <p></p>
    <p>Grid</p>
    <p></p>
    <p>Flex</p>
    <p></p>
    <p>Grid</p>
    <p></p>
    <p>Flex</p>
    <p></p>
    <p>Grid</p>
    <p></p>
  </div>
</body>
```

```css
.container {
  display: grid;
  grid-template-columns: 4fr 6fr;
  grid-template-columns: 200px 1fr; /* 앞부분만 고정하고 싶다면*/
  grid-gap: 1rem;
  grid-auto-rows: 200px; /* 컨텐츠와 상관없이 row 크기설정*/
  grid-auto-rows: minmax(200px, auto); /* 최소 크기 설정하고 컨텐츠가 길다면 auto로 맞춤 */
  justify-items: center;
  align-itmes: center;
}

.item.nth-child(1) {
  grid-column: 1/4; /* 한 칸이 3칸 다 차지하도록. 1번줄에서 4번줄까지 설정 */
}

.item.nth-child(4) {
  grid-column: 3; /* 컬럼 3에서 시작 */
  grid-row: 2/4;
}

.item:nth-child(5) {
  jutify-self: start;
  align-self: center; /* 각각 정렬 */
}
```

---

### 참고

[CSS Flexbox와 CSS Grid, 한번에 정리!](https://www.youtube.com/watch?v=eprXmC_j9A4)
