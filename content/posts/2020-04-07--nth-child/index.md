---
title: ":nth-child"
tags: ["CSS"]
cover: child.jpg
author: mmyeon
---

## 이 스타일을 어디에 적용했나요?
프리요가캠프 프로젝트를 하던 중 아이템 리스트에서 첫 번째 div요소의 상단과 마지막 div요소 의 하단에만 곡선을 주기 위해 사용했다.


## 형제사이에서의 순서에 따라 요소를 선택하기
인덱스는 1부터 시작!


~~~css
/* 아이템 리스트의 첫번째 <div> 선택 */
div:nth-child(1) {
  border-radius : 15px 15px 0 0;
}

/* 아이템 리스트의 마지막 <div> 선택 */
div:nth-last-child(1) {
  border-radius : 15px 15px 0 0;
}

/* 임의의 그룹에서 네 번째에 위치하는 모든 요소 선택 */
:nth-child(4n) {
  color: lime;
}

/* 홀수번째 */
:nth-child(odd) 또는 :nth-child(2n+1)

/* 짝수번째 */
:nth-child(even) 또는 :nth-child(2n)
~~~



