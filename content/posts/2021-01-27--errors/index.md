---
title: "다시 만난 자바스크립트 에러들"
tags: ["JS"]
cover: til.jpg
author: mmyeon
---

## 에러는 언제 발생하는가?

JS는 인터프리터 언어이기 때문에, 브라우저가 JS를 해석하다가 에러가 발생하면 해석을 중단한다.

## 에러는 모든 것을 알려준다

JS에서 에러가 발생하면 콘솔창에 에러가 기록된다.

## 에러문구 꼼꼼히 읽기

## SyntaxError

자바스크립트에서 발생된 문법 에러 => `오타 확인하기`

```js
vars a = 10;
// Uncaught SyntaxError: Unexpected identifier

```

## RangeError

허용된 범위를 넘는 값을 적용하려고 할 때 발생

```js
new Date("2014–25–23").toISOString();
// Uncaught RangeError: Invalid time value
```

## ReferenceError

잘못된 값을 참조하려고 할 때 발생함 => `해당 코드 다시 살펴보기`

```js
test();
// Uncaught ReferenceError: test is not defined
```

## TypeError

배열이 아닌 값에 배열메서드 사용할 때 발생함 =>`값의 타입 체크하기`

```js
window.test();
// Uncaught TypeError: window.test is not a function
```

## URLError

URL 형태가 잘못되었을 때 발생

```js
decodeURIComponent("%");
// Uncaught URIError: URI malformed
```

---

### 참고

[Javascript와 에러 Error](https://pks2974.medium.com/javascript%EC%99%80-%EC%97%90%EB%9F%AC-error-d5b1c1124d16)<br>
