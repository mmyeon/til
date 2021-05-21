---
title: Pure Functions without side effects
tags: ["REACT"]
cover: pure.jpg
author: mmyeon
---

## [오늘의 질문] 사이드 이펙트가 뭘까?

오늘의 질문은 리액트 공식문서를 읽다가 side effect를 만난 것에서 시작했다.

You’ve likely performed data fetching, subscriptions, or manually changing the DOM from React components before. <b> `We call these operations “side effects” (or “effects” for short) because they can affect other components and can’t be done during rendering.`</b>

---

## side effect

사이드 이펙트는 `실행된 함수 스코프 밖에 영향을 미치는 것`으로,<br>
산출(computation)이 오직 산출의 결과만 리턴하는 것이 아니라
다른 변화가 관찰되는 것을 의미한다.
<br>
따라서 클로저 스코프 변수의 값을 바꾸는 것도, 인수로 전달된 배열에 새로운 아이템을 푸쉬하는 것도 사이드 이펙트에 포함된다.

<b>그렇다면 사이드 이펙트가 없는 함수는 어떤 함수일까?</b>

사이드 이펙트 없이 실행되는 함수를 순수함수라고 한다.

## Pure Functions

순수함수에 대해 좀 더 알아보자.

<b>⭕순수함수는 사이드 이펙트가 없다</b><br>
순수 함수는 단지 새로운 값을 산출한다.

<b> ⭕ 순수함수는 예측가능하다.</b><br>
같은 인풋이 주어지면 항상 같은 아웃풋을 리턴한다.<br>
따라서 테스트하기 쉽고 리팩토링이나 최적화에 유용하다.

<b> ⭕ 순수함수는 전달받은 인수를 수정하지 않는다.</b><br>
배열을 전달받으면 원본 배열에 아이템을 덮어쓰지 않고
새로운 배열을 리턴한다.

---

### 참고

[순수함수](https://egghead.io/lessons/react-redux-pure-and-impure-functions)<br>
[사이드이펙트](https://www.reddit.com/r/reactjs/comments/8avfej/what_does_side_effects_mean_in_react/)
