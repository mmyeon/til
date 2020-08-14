---
title: Factorialize a Number
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥포스팅 전에 알아야 할 함수의 특성

- 함수 return을 만나면 제어권이 함수 밖으로 나가게 된다.
- 리턴이 없는 함수는 undefined를 리턴한다.

---

## 🔥Factorialize a Number를 구해보자

➡️ 첫 번째 방법

```js
function factorialize(num) {
  let product;
  for (product = 1; num > 0; num--) {
    product *= num;
  }
  return product;
}

factorialize(5);
```

<b>코드 해석</b>

- product 변수가 1로 초기화되어 있다.
- `num = 0`인 경우에 루프 조건이 거짓이므로 실행되지 않고
- product가 1로 초기화되었기 때문에 리턴문이 실행될 것이다.

---

<br>

➡️ 두 번째 방법

### 🔥 기본 재귀 함수

- 재귀함수란 함수 내부에서 자기 자신을 호출해서 실행하는 함수를 말한다

```js
function factorialize(num) {
  if (num === 0) {
    return 1;
  }
  // 함수가 다시 호출될때 인자로 num-1을 전달함
  return num * factorialize(num - 1);
}
factorialize(5);
```

<b>코드 해석</b>

- 재귀함수사용
- `num === 0`이라면 1을 리턴하고 재귀를 끝낸 뒤 스택에게 상위 레벨로 이 값을 전파하라고 알려준다.
- 만약 이 조건을 가지지 않는다면 재귀는 스택이 낭비될 때까지 계속 반복될 것이다.

<b>자바스크립트 평가 순서</b>

`factorialize(5)`를 호출하면

```js
factorialize(5);
5 * factorialize(4);
5 * 4 * factorialize(3);
5 * 4 * 3 * factorialize(2);
5 * 4 * 3 * 2 * factorialize(1);
5 * 4 * 3 * 2 * 1;

120;
```

### 🔥 또 다른 재귀함수, 꼬리 함수

```js
function factorialize(num, factorial = 1) {
  if (num == 0) {
    return factorial;
  } else {
    return factorialize(num - 1, factorial * num);
  }
}

factorialize(5);
```

<b>코드 해석</b>

- 메모리 사용을 최적화하기위해서 Tail Recursion 사용했다.
- 재귀 함수 호출을 개별로 평가해서 `factorial`값을 업데이트한다.

<b>자바스크립트 평가 순서</b>

```js
factorialize(5, 1);
factorialize(4, 5);
factorialize(3, 20);
factorialize(2, 60);
factorialize(1, 120);
factorialize(0, 120);

120;
```

### 🔥 head recursion과 tail recursion의 차이

`head recursion`

- 재귀 호출을 먼저하고 그 다음에 호출의 리턴 값을 가지고 결과를 계산하는 방법이다.
- <b>그렇기 때문에 모든 재귀 호출을 리턴할 때까지 계산의 결과를 얻을 수 없다.</b>
- 자바스크립트 해석기가 평가를 시작하기 전에 재귀함수가 호출된다.

`tail recursion`

- tail 재귀에서는 계산을 먼저하고 현재 스텝의 값을 다음 재귀 스텝으로 전달하면서 그 다음에 재귀 호출을 실행한다.
- <b>각각의 재귀 호출을 평가하면서 factorial은 업데이트 된다.</b>
- 베이스 케이스에 도달할 때까지 모든 평가와 계산이 스택에 저장되는 헤드 재귀함수와 다른 점이다.

---

### 참고

[Factorialize a Number?](https://forum.freecodecamp.org/t/freecodecamp-challenge-guide-factorialize-a-number/16013)
<br>
[Tail recursion](https://stackoverflow.com/questions/33923/what-is-tail-recursion)
