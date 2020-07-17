---
title: "Promises, async/await(1) - 콜백함수"
tags: ["JS"]
cover: callback.jpg
author: mmyeon
---

## 비동기란?

setTimeout 내장함수와 같이 현재 정의하지만 시간이 흐른 뒤 끝나는 작업들을 뜻한다.

### 예시로 확인해보자.

`주어진 src를 가진 script를 로딩하는 코드`

```js
function loadScript(src) {
  // `<script>` 태그를 만들어서 페이지에 추가하기
  //  스크립트에 소스가 주어지면 브라우저는 로딩을 시작하고 로딩이 끝나면 실행됨.
  let script = document.createElement("script");
  script.src = src;
  document.head.append(script);
}
```

### 함수를 호출해보자

```js
// load and execute the script at the given path
loadScript("/my/script.js");
```

- 이 스크립트는 비동적으로 실행된다. 다시 말하자면 스크립트 로딩이 끝날때까지 기다리지 않고 다음 코드를 실행한다.
- 여기서 우리는 스크립트가 제공하는 정보를 사용하기 위해서 언제 로딩이 완료되는 지 알고 싶다.
- 로딩이 완료되었는지 알기 위해 콜백을 추가하자.

### 함수실행이 완료된 뒤에 처리할 콜백함수를 두번째 인자로 전달해보자.

- 콜백함수는 액션이 완료된 후 실행될 함수이며 대부분 익명함수로 사용된다.
- 비동기적으로 무언가를 하는 함수는 반드시 콜백함수를 인자로 제공받아야 한다.

```js
function loadScript(src, callback) {
  let script = document.createElement("script");
  script.src = src;
  script.onload = () => callback(script);
  document.head.append(script);
}

loadScript("https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.2.0/lodash.js", script => {
  alert(`Cool, the script ${script.src} is loaded`);
  alert(_); // function declared in the loaded script
});
```

## 비동기식 코드를 순서적으로 처리하고 싶으면 어떻게 해야할까?

### 콜백 안에 콜백 : 하나의 스크립트 -> 다음 스크립트

- 자연스러운 해결방법은 두번째 함수의 콜을 콜백함수에 안에다 넣는 것이다.
- 바깥 함수가 완료된 뒤에 콜백이 내부 함수를 초기화한다.

```js
loadScript("/my/script.js", function(script) {
  alert(`Cool, the ${script.src} is loaded, let's load one more`);

  loadScript("/my/script2.js", function(script) {
    alert(`Cool, the second script is loaded`);
  });
});
```

### 그렇다면 더 많은 스크립트가 존재한다면?

```js
loadScript("/my/script.js", function(script) {
  loadScript("/my/script2.js", function(script) {
    loadScript("/my/script3.js", function(script) {
      // ...continue after all scripts are loaded
    });
  });
});
```

- 이렇게 되면 모든 새로운 액션은 콜백 함수 안에 있게 된다. 몇 개는 괜찮지만 수가 많아지면 구조가 복잡해지면서 코드 가독성이 좋지 않다

## 에러 다루기

- 위의 코드는 에러를 고려하지 않았다.
- 만약에 로드가 실패한다면? 우리의 콜백은 반드시 에러에 반응할 수 있어야 한다.

### 에러를 고려해보자

```js
// 함수정의(참조)를 넣음
function loadScript(src, callback) {
  let script = document.createElement("script");
  script.src = src;

  //콜백함수를 호출
  script.onload = () => callback(null, script);
  script.onerror = () => callback(new Error(`Script load error for ${src}`));

  document.head.append(script);
}

//함수 사용하기
loadScript("/my/script.js", function(error, script) {
  if (error) {
    // handle error
  } else {
    // script loaded successfully
  }
});
```

- 위의 코드를 `error-first callback 스타일`이라 부른다.
  - `콜백의 첫 번째 인자`는 에러가 발생하면 `에러 핸들러`를 정의해놓음. callback(err)가 호출됨
  - `두 번째 인자`는 성공적인 결과를 위한 것으로 callback(null, result1, result2...)가 호출됨
  - 하나의 콜백 함수가 에러를 보고하고 결과를 전달하는데 사용된다.

## 운명의 피라미드 / 콜백지옥

### 비동기식 코딩에서 콜백이 몇 백개 중첩되었다면?

```js
loadScript("1.js", function(error, script) {
  if (error) {
    handleError(error);
  } else {
    // ...
    loadScript("2.js", function(error, script) {
      if (error) {
        handleError(error);
      } else {
        // ...
        loadScript("3.js", function(error, script) {
          if (error) {
            handleError(error);
          } else {
            // ...continue after all scripts are loaded (*)
          }
        });
      }
    });
  }
});
```

- 위 코드의 문제점은 코드가 중첩될수록 깊어지고, 관리하기가 더 어려워진다는 것이다.

### 개선해보자

- 함수를 개별적으로 만들면 문제를 해결할 수 있다.

```js
loadScript("1.js", step1);

function step1(error, script) {
  if (error) {
    handleError(error);
  } else {
    // ...
    loadScript("2.js", step2);
  }
}

function step2(error, script) {
  if (error) {
    handleError(error);
  } else {
    // ...
    loadScript("3.js", step3);
  }
}

function step3(error, script) {
  if (error) {
    handleError(error);
  } else {
    // ...continue after all scripts are loaded (*)
  }
}
```

1. 모든 액션을 분리된 top-level 함수로 만들어서 중첩을 해결한다.
2. 그러나 가독성이 떨어진다. 이 함수에서 저 함수로 이동하면서 봐야함.
3. 코드에 익숙하지 않은 사람이 보면 어느 코드를 읽어야 할지 모르기때문에 불편하다.
4. <b>step\*이름의 함수는 오직 콜백지옥을 피하기 위해서 만들어졌기 때문에 액션 체인 밖에서 그 함수들을 재사용하지 못한다.</b> 그래서 약간의 namespace cluttering이 존재한다.

### 다행히 이런 콜백지옥을 피할 다른 방법이 있다.

## 바로 promise다!

다음 포스팅에서 promise를 만나보자.

---

## 콜백 과제

- 점점 커지는 원을 보여주는 `showCircle(cx.cy,radius)함수`를 만들기
- 원의 크기가 커지고 난 뒤에 메세지가 보여야함

### 해결방안

- `function showCircle(cx,cy,radius)`는 원을 그리는 데 원이 다 그려졌을 때 트랙할(알게될) 방법이 없음
- 그걸 해결하기 위해서 애니메이션이 끝난 뒤에 호출될 콜백함수를 추가함.
- `showCircle(cx, cy, radius, callback)`
- 콜백함수는 div(원의 요소)를 인자로 받아야 한다.

```js
    function showCircle(150,150,100,div => {
    	div.classList.add("message-ball");
    	div.append("Hello, world!");
    })
```

---

## 참고

[콜백함수](https://javascript.info/callbacks)
