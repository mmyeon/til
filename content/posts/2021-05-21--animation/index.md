---
title: "Transition, Transform, Animation 정리하기"
tags: ["CSS"]
cover: animation.jpg
author: mmyeon
---

### Transition, Transform, Animation을 공부한 이유

- 개인 웹사이트에 애니메이션을 추가하고 싶어서
  <a href="https://www.manning.com/books/css-in-depth" target="_blank">CSS in Depth</a> 책을 읽고 공부한 뒤 정리해보았다.

## 본격적으로 페이지에 모션을 추가해보자

✅ Transition <br>
✅ Transform<br>
✅ Animation<br>

---

## 🔥 Transition 🔥

- 값의 변경을 갑작스럽지 않고 자연스럽고 끊김없게 만들어줄 때 사용.

### 사용 예시

```css
transition-property: all;

transition: background-color 0.5s linear 0.5s;
```

- transition 적용할 요소, 지속시간, time function, 딜레이 시간
- 0이어도 유닛(s) 꼭 써주기

### 트랜지션을 여러 요소에 적용하려면?

```css
transition: border-radius 0.5s linear, background-color 0.6s ease;
```

### Timing Function

- A값에서 B값까지 어떤 속도로 움직일 것인가

| Timing Function | 의미                                  |
| --------------- | ------------------------------------- |
| linear          | 처음부터 끝까지 같은 속도가 유지된다. |
| ease-in         | 처음엔 느리다가 끝에는 빨라진다.      |
| ease-out        | 처음엔 빠르다가 끝에는 느려진다.      |

### 내가 원하는 속도가 존재하지 않는다면?

커스텀할 수 있는 `Bezier curves` 사용하자

### 그렇다면 언제, 어떤 timing function을 사용하면 좋을까?

| Timing Function         | 자주 사용하는 경우                                                              |
| ----------------------- | ------------------------------------------------------------------------------- |
| linear                  | 컬러 변화, fade-in, fade-out                                                    |
| ease-in (decelerating)  | 유저가 변화를 주었을 때, <br>hover, click처럼 유저가 바로 변화를 확인해야 할 때 |
| ease-out (accelerating) | 시스템의 발생시간 변화, loading 끝났을 때                                       |

### 단계별로 변화를 주고 싶다면? step ()

```css
step(2, end)
```

- 이전의 Timing Function과 다르게 마치 시계 초첨처럼 한칸 한칸 끊기듯이 변화가 적용된다.
- 비트 게임이나 전광판에 많이 사용됨

### Transition효과를 자연스럽게 주려면?

- 2000 ~ 5000ms 사이에 있어야 자연스럽다. 이 시간보다 길어지면 유저는 페이지가 느리다고 느낀다. 특히 hover, fade, scale은 3000ms 이하가 좋다.

### 앗, Transition이 적용되지 않는다면? 😥

✅ display에는 트랜지션이 적용되지 않는다.

- 트랜지션이 적용되지 않는 프로퍼티들이 존재한다.`display`, `url()`의 경우는 트랜지션이 적용되지 않아서 다른 방법으로 구현해야 한다.

✅ display를 <b>opacity + visibility</b> 조합으로 변경하기

```css
opacity: 0;
```

- 이때 opacity는 화면상에서 보이지 않을 뿐 자리를 차지하고 있기 때문에 보이지 않는 요소가 클릭될 수도 있다. 따라서 `visibility:hidden` 을 추가해서 레이아웃에서는 유지되지만 visible 페이지에서는 보이지 않도록 해야한다.

## 자주 쓰는 Transition

### Fade-out 효과

- opacity -> visibility 순서대로 효과 적용하기.
- opacity가 끝난 후에 visibility가 적용되도록 시간 텀을 두기.

### Slide open

`height:0`에서 클릭 이벤트가 발생하면 `height:auto`로 변경하면 된다.
여기서 알아두어야 할 부분은 auto값에는 트랜지션이 적용되지 않기 때문에 DOM 요소의 높이를 알아내야 한다.
`DOM element.scrollHeight`가 바로 DOM 요소의 높이를 뜻한다.

---

## 🔥 Transform 🔥

```css
transform: matrix(1, 2, 3, 4, 5, 6);

transform: translate(120px, 50%);

transform: scale(2, 0.5);

transform: rotate(0.5turn);

transform: skew(30deg, 20deg);

transform: scale(0.5) translate(-100%, -100%);
```

### Transform이 뭔데?

- document flow를 이동시키지 않으면서 해당 요소만 변화시키는 프로퍼티이다. 따라서 transform 으로 요소를 이동시키면 주변 요소들과 겹치게 된다. 이를 해결하기 위해서 margin이 넉넉하게 주어져야 한다.

### Transform은 사용조건이 있다?

block요소에만 적용되기 때문에 display가 inline이라면 `display:inline-block`으로 수정해줘야 한다.

### 이동 효과의 중심을 변경하고 싶다면?

`transform-origin`

### 여러 개의 transform을 사용하려면?

```css
transform: rotate(15deg) translate(20px, 0);
```

- 오른쪽에서 왼쪽 순서로 실행되기 때문에 먼저 실행할 프로퍼티를 오른쪽에 입력하면 좋다.

## 자주 쓰는 Transform

### Hover하면 아이콘 커지기

- <b>문제점</b> : 아이콘 크기가 커지면 document flow가 다시 계산되면서 주변 요소들이 밀리게 된다

- <b>해결방법</b> : transform 프로퍼티를 사용해서 주변 요소들 영향 주지 않으면서 아이콘크기 변경시키기

> ### 아이콘은 svg를 사용하자
>
> `Scalable Vector Graphics`<br>
> XML 베이스의 이미지로, 이미지를 vertor를 사용해서 정의내린 format이다.<br>
> 이미지가 수치로 정의되어 있어서 어떤 사이즈로든 확대, 축소 할 수 있다.

### 안보이다가 날아오는 fly-in label 만들기

- hover하면 텍스트가 왼쪽에서 등장하는 효과
- transition delay를 각 자식 요소에 다르게 설정하면 transition이 계단식으로 적용되는 걸 확인할 수 있다.

더 나아가 렌더링 성능에 대해 알아보자

### rendering 파이프라인의 3단계

페이지가 브라우저에 어떻게 렌더되는지 살펴보기

`레이아웃 → 페인트 → Composite(합성)`

<b>레이아웃</b> <br>

- 브라우저가 스크린에서 요소가 어디에 얼만큼의 공간을 차지할지 계산한다.
- 따라서 요소의 width, height가 변경되면 공간이 바뀌므로 layout 다시 계산된다.
- JS에 의해서 DOM이 제거,추가되어도 마찬가지로 layout 변경되므로 브라우저가 페이지 flow를 다시 구성한다.

<b>페인트</b> <br>

- 픽셀로 채우는 것
- 배경 컬러 변경하면 레이아웃은 그대로 유지한 상태로 다시 페인트한다.

### 3D transforms

<b>애니메이션이 자연스러워 보이려면?</b>

- 브라우저는 1초에 60번 refresh되어서 animation도 같은 비율을 따라가야 자연스러워 보인다.

### z 축 이란?

- 유저에게서 가까워지는 혹은 멀어지는 방향

### 3D 입체 공간 만들기

`perspective`는 3D transform의 필수 요소

- 카메라와 장면간의 거리라고 생각하면 된다.
- <b>거리가 가까울수록, perspective 숫자가 작을수록 3D 효과는 더 커진다</b>

### 동일한 perspective를 공유하려면?

- 부모나 조상에 perspective 프로퍼티를 적용하면 같은 3D 효과가 적용된다.
- 하나의 요소에만 적용하려면 `transform : perspective(400px)`

### 좀 더 고급스러운 3D Transform

- `perspective-origin` : 카메라 위치 변경

- `backface-visibility` : 180도 회전한 경우 element의 뒷모습이 보이게 한다. 다른 카드랑 겹쳐서 마치 하나의 카드인 것처럼 할 수 있다.

- `transform-style : preserve-3d` : parent 요소에 적용하면 자식 element를 3D공간으로 위치하게 함.

---

## 🔥 Animation 🔥

### keyframes

- `keyframe —— keyframe —— keyframe`
- 키프레임을 정의하면 브라우저가 사이에 모든 프레임을 삽입해준다.

### 애니메이션 사용방법

```css
.shake {
  animation: shake 0.7s linear;
}

@keyframes shake {
  0%,
  100% {
    transform: translateX(0);
  }
  10%,
  30%,
  50%,
  70% {
    transform: translateX(-0.4em);
  }
  20%,
  40%,
  60% {
    transform: translateX(0.4em);
  }
  80% {
    transform: translateX(0.3em);
  }
  90% {
    transform: translateX(-0.3em);
  }
}
```

- <b>1. @keyframes 정의</b>
- <b>2. 애니메이션 프로퍼티 적용</b>

```css
animation: keyframe이름 지속시간 timing-function 반복횟수;
```

### 애니메이션을 자연스럽게 보이는 TIP

- <b>애니메이션이 자연스러우려면 처음과 마지막의 컬러나 위치가 같도록 한다.</b>

---

### 회고

- 정리한 개념을 프로젝트에 적용하면서 복습하는 시간을 가질 예정이다. CSS 책을 읽을때는 이해가 됐다고 생각했는데 포스팅을 하다보니 모르는 부분이 몇 가지 있어서 다시 검색해서 보충했다. 정리하면서 내가 모르는 부분을 발견해서 다행이라고 생각한다. 계속 공부하면서 모르는 부분을 발견하고 채워나가야 겠다.

---

## 참고

[렌더링 성능](https://developers.google.com/web/fundamentals/performance/rendering?hl=ko)<br>
[Perspective](https://3dtransforms.desandro.com/perspective)
