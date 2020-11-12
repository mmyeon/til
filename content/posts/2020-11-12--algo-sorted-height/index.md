---
title: "#32 - Sort 구현하기"
tags: ["Algorithm"]
cover: knot.jpg
author: mmyeon
---


### 문제
`키가 주어지면 순서대로 제대로 섰는지 확인하는 프로그램`


**예시** <br>
입력 : 176 156 155 165 166 169 <br>
출력 : NO

입력 : 155 156 165 166 169 176 <br>
출력 : YES

---

### 나의 접근법
인풋 : 키 문자열<br>
아웃풋 : YES or NO

- 인풋을 받아서 배열로 변환
- 배열의 두 요소의 값을 비교해 앞의 요소가 크면 "NO" 리턴하기


~~~js
let input = prompt("키를 입력하시오");
let height = input.split(" ");

function isSorted() {
  for (let i = 0; i < height.length; i++) {
    if (height[i] > height[i + 1]) {
      return console.log("NO");
    }
    return console.log("YES");
  }
}

isSorted();
~~~

### 아쉬운 점
키 목록의 정렬된 값을 알 수 없다. 


---

### 답안 
~~~js
const unsorted = prompt('키를 입력하세요');
let sorted = "";

sorted = unsorted
  .split(" ")
  .sort(function(a, b) {
    return a - b;
  })
  .join(" ");

if (unsorted === sorted) {
  console.log("Yes");
} else {
  console.log("No");
}
~~~

### **wow**한 부분
나는 단순히 두개의 값만 체크하도록 했는데<br>
정렬한 값과 입력받은 값이 같은지 비교하니까 코드가 엄청 깔끔하다.

------
## 참고

[제주 코딩 베이스캠프 Code Festival  Javascript 100제](http://paullab.co.kr/codefestival.html)
   






