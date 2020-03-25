---
title: CSS 개념 정리하기 1
tags: ["CSS"]
cover: CSS.jpg
author: mmyeon
---

### 박스 크기를 어떻게 파악할 것인가

```css
/* 테두리를 포함해서 박스크기 지정*/
* {
  box-sizing: border-box;
}
```

---

### CSS Grid Layout Module

```css
.tab {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 50px;
  text-align: center; /* 요소 안에 있는 텍스트를 가로로 중앙 정렬함. */
  align-items: center; /* 요소 중앙 정렬함(메인 반대축) */
  justify-content: center; /* 아이템들을 컨테이너 중앙으로 정렬함 (메인축) */
}
```

---

### Grid와 Flex의 차이

- **Grid**
  - 컨테이너 기반이라 컨테이너에서 아이템 사이즈 결정됨
  - Gap 프로퍼티 있음
  - 여러 column나 row안에서 요를 정렬할 때 좋음.
- **Flexbox**
  - 내용 기반이라 아이템에서 아이템 사이즈 결정됨
  - Gap 프로퍼티 없음
  - 하나의 column이나 row 안에서 요소를 정렬할 때 좋음.

---

### 화면의 전체가 아닌 일부에 컨텐츠를 보이고 싶다면

```css
.container {
  max-width: 70%; /* 화면의 비율 */
  margin: auto; /* 블록레벨 엘리먼트에 width 설정 후 auto로 가로 중앙으로 정렬*/
  overflow: hidden; /* 요소의 콘텐츠가 너무 커서 요소의 블록 크기를 맞출 수 없을 때, 벗어난 컨텐츠를 보이지 않게 함 */
}
```
