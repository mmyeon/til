---
title: "백준 4673번 | 셀프 넘버"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 셀프 넘버 🔥

### 문제

셀프 넘버는 1949년 인도 수학자 D.R. Kaprekar가 이름 붙였다. 양의 정수 n에 대해서 d(n)을 n과 n의 각 자리수를 더하는 함수라고 정의하자. 예를 들어, d(75) = 75+7+5 = 87이다.

양의 정수 n이 주어졌을 때, 이 수를 시작해서 n, d(n), d(d(n)), d(d(d(n))), ...과 같은 무한 수열을 만들 수 있다.

예를 들어, 33으로 시작한다면 다음 수는 33 + 3 + 3 = 39이고, 그 다음 수는 39 + 3 + 9 = 51, 다음 수는 51 + 5 + 1 = 57이다. 이런식으로 다음과 같은 수열을 만들 수 있다.

33, 39, 51, 57, 69, 84, 96, 111, 114, 120, 123, 129, 141, ...

n을 d(n)의 생성자라고 한다. 위의 수열에서 33은 39의 생성자이고, 39는 51의 생성자, 51은 57의 생성자이다. 생성자가 한 개보다 많은 경우도 있다. 예를 들어, 101은 생성자가 2개(91과 100) 있다.

생성자가 없는 숫자를 셀프 넘버라고 한다. 100보다 작은 셀프 넘버는 총 13개가 있다. 1, 3, 5, 7, 9, 20, 31, 42, 53, 64, 75, 86, 97

10000보다 작거나 같은 셀프 넘버를 한 줄에 하나씩 출력하는 프로그램을 작성하시오.

### 입력

입력은 없다.

### 출력

10,000보다 작거나 같은 셀프 넘버를 한 줄에 하나씩 증가하는 순서로 출력한다.

## 어떻게 풀었는가

> 셀프 넘버가 아닌 숫자를 제외시키는 방식으로 진행<br>
> 모든 숫자가 셀프 넘버라는 가정에서 시작

- 숫자와 각 자리의 숫자를 더한 합계를 구하기
- 셀프 넘버와 다른 숫자를 구분하기 위해 입력받은 숫자의 크기만큼 true값을 가지는 배열 만들기
- 해당 배열에서 숫자의 합계에 해당하는 값은 false값으로 변경
- true값만 콘솔에 로그 남기기

### 놓친 부분

- 입력을 받지 않기 때문에 함수 호출을 직접 해야한다.

```js
function getSum(n) {
  let sum = n;
  while (n !== 0) {
    sum = sum + (n % 10);
    n = parseInt(n / 10);
  }
  return sum;
}

function isSelfNum(n) {
  let selfNumber = [];
  for (let i = 0; i <= n; i++) {
    selfNumber.push(true);
  }

  for (let i = 1; i < n; i++) {
    let notSelfNum = getSum(i);

    if (notSelfNum < n) {
      selfNumber[notSelfNum] = false;
    }
  }

  for (let i = 1; i < n; i++) {
    if (selfNumber[i]) {
      console.log(i);
    }
  }
}

isSelfNum(10000);
```

## WILT : What I Learned Today 🤔

- 문제를 이해하지 못한 상태에서 해결하려고 하니 이도 저도 아니게 되었다. `문제 이해 -> 노트에 해결 방법 단계별로 적기`가 완전히 끝난 뒤에 코드를 쓰기 시작해야 한다는 걸 다시 한 번 배웠다. 코드 작성은 생각하는 걸 구현하는 거라서 사실상 문제를 이해하고 방법을 생각해내는 데 더 많은 시간을 들여야 하는 것이다.
- 무엇이 문제인지 아는 것에서부터 문재 해결이 시작된다. 다시 명심하자!
- (다르게 풀기) 다른 분들의 코드를 참고해서 해결한 문제라 내일 다시 풀어보려고 한다. 이번엔 셀프넘버를 변수에 담아서 한 번만 출력하도록 해야지!

---

## 참고

[4673번: 셀프 넘버](https://www.acmicpc.net/problem/4673)

[알고리즘 문제풀이 - 백준 온라인(BOJ) 4673번 문제](https://www.youtube.com/watch?v=7G0U5Gd0ksM&t=2s)