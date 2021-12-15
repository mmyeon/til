---
title: "React에서 Intersection Observer API 사용하기"
tags: ["REACT"]
cover: observer.jpeg
author: mmyeon
---

## Intersection Observer API를 공부하게 된 이유

- 특정 컴포넌트가 뷰포트의 상단에 도달했을때 애니메이션이 동작하는 기능을 추가하려고 한다.
  현재는 APP 컴포넌트가 마운트되자마자 애니메이션이 동작해서 해당 컴포넌트에 도달했을 때 애니메이션의 동작을 확인할 수가 없었다.

## Intersection Observer API란 ?

- 특정 요소(타겟 요소)가 타겟 요소의 부모나 뷰포트에 교차하는지를 비동기적으로 감지해서 교차할때마다 콜백함수를 호출하는 API를 뜻한다.

## Intersection Observer를 초기화해보자🔥

### Intersection Observer 객체 생성자가 필요로 하는 건 2가지다

```js
const observer = new IntersectionObserver(callbakcFunction, options){
	observer.observe(targetElement)
}
```

- ✅ 두 요소가 교차가 되었을때 실행할 `콜백함수` <br>
- ✅ `옵션`

```jsx
const options = {
  root: null,
  rootMargin: "0px",
  threshold: 1
};
```

### 옵션 객체에 대해 더 살펴보자.

- <b>root</b> : 루트 요소로 `타겟이 보이는지 확인하기 위한 뷰포트`를 의미한다. root가 null이거나 특정짓지 않으면 브라우저 뷰포트를 뜻함. 타겟의 부모, 조상이어야 한다.
- <b>rootMargin</b> : 루트 요소를 둘러싼 박스에 대한 값으로, CSS의 margin과 유사하다.
- <b>threshold</b> : 문지방을 뜻한다. 원하는 요소가 얼마나 노출되었는지를 나타내는 `intersection ratio`이다. 다시 말해서 타겟요소가 root 요소내에서 얼마나 보여지는지를 나타내는 0 ~ 1의 값으로 <b>타겟 요소가 원하는 만큼 노출될때마다 콜백함수가 호출된다.</b>
  <br>- 단일 숫자나 숫자 배열로 값을 설정할 수 있다. 25% 단위로 타겟 요소의 보일때마다 콜백함수를 호출하고 싶다면 `threshold :[0,0.25,0.5,0.75,1]`로 설정하면 된다.
  <br>- 값이 0이면 요소가 1px이라고 보이면 콜백함수를 실행하겠다는 의미고, 값이 1이면 100% 다 보여야 콜백함수를 실행하겠다는 것을 뜻한다.

## Intersection Observer의 컨셉

- 관찰되길 바라는 타겟 요소를 observer에 전달한다.
- 대상 요소가 화면에 보이는 정도가 달라졌을때마다 실행될 콜백함수를 등록한다
- 타겟 요소가 `InsersectionObserver`에서 특정한 threshold와 만날때마다 콜백 함수가 실행된다.
- 콜백함수는 `IntersectionObserverEntry`의 entry 객체 리스트를 받는다.

---

## 🔥 Intersection Observer API를 리액트에서 사용하기🔥

<b> 1. 타겟 요소 지정하기</b>

```js
const containerTarget = useRef(null);
```

- 관찰하고 싶은 요소에 리액트훅인 `useRef`를 사용해서 참조를 만든다

<b> 2. IntersectionObserverEntries의 배열을 파라미터로 받는 콜백함수를 선언하기</b>

- 함수 내부에는 교차했는지 여부를 알려주는 `entry.isIntersecting`값으로 스테이트를 관리한다.

<b> 3. `option 객체`를 만들기</b>

<b> 4. 리액트 훅인 `useEffect`를 추가해서 콜백함수와 옵션 객체를 사용해서 observer 생성자를 만든다</b>

```js
const observer = new IntersectionObserver(callbackFunction, options);
```

- 컴포넌트가 언마운트될때 우리의 타겟을 감시하는 걸 멈추기 위해서 클린업 함수를 리턴할 수 있다.(옵션임)

<b> 5. 관찰하고 싶은 타겟 요소에 useRef 변수를 세팅하기.</b>

```jsx
<div ref={containerTarget} />
```

---

### 코드 로직 분리해서 리액트훅 만들기

- options를 파라미터로 가지는 `useComponentOnScreen` 함수를 만든다
- `useRef,useState, useEffect`를 새로운 함수 내부로 옮긴다
- containerRef와 스테이트를 배열로 리턴한다

### 만든 리액트 커스텀 훅 `useComponentOnScreen` 사용하기

- hook 파일을 원하는 컴포넌트에서 import한다
- 옵션 객체를 이용해서 `useComponentOnScreen 함수`를 초기화 하기

---

### 회고

- 처음에 문서를 읽었을때 이해가 되지 않아서 실제로 리액트에서 어떻게 쓰였는지 설명된 블로그 글을 많이 참고했다. 원하는 기능을 구현한 뒤에 다시 문서를 읽으니 처음 읽을 때보다 개념이 덜 낯설게 느껴졌다. 문서를 읽다가 <b>요소가 교차하는지를 감지하기 위해서 브라우저가 `메인스레드`에서 하던 작업을 이제는 `Intersection Observer API`를 통해 비동기적으로 처리할 수 있다</b>는 문장을 보았다. 이 부분이 이해가 잘 가질 않아서 메인스레드와 비동기에 관한 글을 읽어본 뒤 그 차이점에 대해 정리를 해보려고 한다.

---

### 참고

[Intersection Observer using React](https://dev.to/producthackers/intersection-observer-using-react-49ko?signin=true)

[React - Intersection Observer API를 사용하여 인피니트 스크롤 구현하기](https://godsenal.com/posts/React-Intersection-Observer%EB%A5%BC-%EC%82%AC%EC%9A%A9%ED%95%98%EC%97%AC-%EC%9D%B8%ED%94%BC%EB%8B%88%ED%8A%B8-%EC%8A%A4%ED%81%AC%EB%A1%A4-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0/)

[Intersection Observer API - Web API | MDN](https://developer.mozilla.org/ko/docs/Web/API/Intersection_Observer_API)
