---
title: CSS 개념 정리하기 2
tags: ["CSS"]
cover: css.jpg
author: mmyeon
---

### width와 max-width

- width : 요소의 너비 설정
- max-width : 요소의 최대 너비 설정, width

```css
.products-center {
  width: 90vw;
  max-width: 1170px;
}
```

---

### 수평 중앙 정렬을 하려면? Flexbox? margin auto?

- 브라우저가 적절한 여백 크기를 선택함.

```css
/* 현대 브라우저에서 요소를 중앙 배치 하려면? */
.products-center {
  display: flex;
  justify-content: center;
}

/* 플렉스 박스 레이아웃을 지원하지 않는 Internet Explorer 8-9 등의 경우라면? */
.products-center {
  margin: 0 auto;
}
```

---

### Grid auto-fit & minmax

```css
.products-center {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
}
```

- **auto-fit** : 그리드에서 충분한 공간이 생기면 가능한 많은 아이템을 채우려고 함
- **1fr** : 고정된 px과는 다르게 브라우저 크기가 바뀌면 비율도 함께 바뀜(flexible)
- **minmax(260px, 1fr)** : 유연한 너비를 가졌지만 최소 260px은 유지.

---

### CSS overflow

- 요소 컨텐츠가 박스 블록보다 클 경우 어떻게 할 지 알려줌

```css
/* Keyword values */
overflow: visible; /* 박스 블록 밖 컨텐츠도 보임 */
overflow: hidden; /* 박스 블록 밖 컨텐츠 숨김 */
overflow: scroll; /* 항상 스크롤바를 보임 */
overflow: auto; /* 스크롤바가 생략되기도 함 */
```

---

### transform

- 요소를 왼쪽에서부터 x거리, 위에서부터 x 거리만큼 이동할 때 사용.

```css
transform: translateX(101%);
transform: translateX(10px); /* Equal to translate(10px) */
```

### 요소를 중앙 집결하기

```css
translate(-50%,-50%);
```

---

### The display Property

- **Block-level Elements** : 새로운 줄에서 시작하고 가로 너비 넓게 차지함. 너비와 높이를 지정할 수 있음.
  - \<div>
  - \<h1> - \<h6>
  - \<p>
  - \<form>
  - \<header>
  - \<footer>
  - \<section>
- **Inline Elements** : 새로운 줄에서 시작하지 않고, 필요한 너비만 차지함.
  - \<span>
  - \<a>
  - \<img>
