---
title: "백준 2869번 | 달팽이는 올라가고 싶다"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 달팽이는 올라가고 싶다 🔥

### 문제

땅 위에 달팽이가 있다. 이 달팽이는 높이가 V미터인 나무 막대를 올라갈 것이다.

달팽이는 낮에 A미터 올라갈 수 있다. 하지만, 밤에 잠을 자는 동안 B미터 미끄러진다. 또, 정상에 올라간 후에는 미끄러지지 않는다.

달팽이가 나무 막대를 모두 올라가려면, 며칠이 걸리는지 구하는 프로그램을 작성하시오.

### 입력

첫째 줄에 세 정수 A, B, V가 공백으로 구분되어서 주어진다. (1 ≤ B < A ≤ V ≤ 1,000,000,000)

### 출력

첫째 줄에 달팽이가 나무 막대를 모두 올라가는데 며칠이 걸리는지 출력한다.

```js
let fs = require("fs");
let input = fs
  .readFileSync("/dev/stdin")
  .toString()
  .trim()
  .split(" ");

const nums = input.map(item => Number(item));
let up = nums[0];
let down = nums[1];
let height = nums[2];

let day = (height - down) / (up - down);

console.log(Math.ceil(day));
```

## WILT : What I Learned Today 🤔

- 문제를 해결하는 패턴을 찾는 연습에 익숙하지 않아서 그런지 좌절하는 경험이 늘어나고 있다. 오늘도 다른 분의 코드를 보면서 내 부족한 부분을 채웠다.
- 마지막에 정상에 도달하면 미끄러지지 않기 때문에 막대 높이에서 down을 한번 제외시켰다. 남아 있는 높이를 오늘 간 거리로 나눠서 얼마나 걸리는지 계산했다. 만약 딱 떨어지지 않으면 아직 한 번 더 올라가야 한다는 의미이므로 Math.ceil() 메서드를 사용해서 반올림했다.
- 흔들리는 마음을 부여잡고 매일 한 문제씩 풀다보면 조금씩 나아지겠지라고 다짐해본다.
- 혼자 풀지 못한 문제는 노션에 따로 기록해서 다시 풀어봐야겠다.

---

## 참고

[2869번: 달팽이는 올라가고 싶다](https://www.acmicpc.net/problem/2869)
[백준 2869번 파이썬 풀이: 달팽이는 올라가고 싶다](https://yoonsang-it.tistory.com/9)
