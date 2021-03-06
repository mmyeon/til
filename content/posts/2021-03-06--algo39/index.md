---
title: "문제39 : 오타 수정하기"
tags: ["Algorithm"]
cover: solve.jpg
author: mmyeon
---

## 🔥 q를 e로 수정하라 🔥

> 입력 : querty</br>
> 출력 : euerty</br>
>
> 입력 : hqllo my namq is hyqwon</br>
> 출력 : hello my name is hyewon

## 나의 접근법

- 입력받은 단어 변수에 저장
- 단어에서 q를 찾아서 e로 변경하는 메서드 사용(교체)
- Str.replace() 메서드는 기존을 원하는 부분으로 교체된 새로운 배열을 리턴함
- 단 첫 번째 문자열만 치환되기 때문에 여러 문자를 교체하고 싶으면 반복문 돌려야 함.

- 위의 방법이 안된다면 문자를 배열의 하나의 요소들로 분리하기
- map사용해서 요소가 q와 같은지 비교해서 e로 변경한 새로운 배열을 리턴함
- 결과 스트링으로 리턴하기
- Array.join() 요소들을 합쳐 하나의 문자열로 리턴함

```js
const wordInput = "hqllo my namq is hyqwon";
const wordArray = wordInput.split("");
const wordChangeResult = wordArray.map(item => (item === "q" ? (item = "e") : item));
const wordResult = wordChangeResult.join("");
console.log("wordResult", wordResult);
```

## 또 다른 접근법

### 함수 만들어서 활용하기

```js
function wordReplaceAll(str, searchStr, replaceStr) {
  return str.split(searchStr).join(replaceStr);
}

console.log(wordReplaceAll(wordInput, "q", "e"));
```

### 정규표현식 활용하기

replace는 첫 번째 값만 변경하므로 모든 값을 변경하기 위해서 정규 표현식 사용함

```js
console.log(wordInput.replace(/q/gi, "e"));
```

---

## WILT : What I Learned Today 🤔

```js
const a = "selected position";
const spliteda = a.split(); // "selected position"

const b = a.split(""); // ["s", "e", "l", "e", "c", "t", "e", "d", " ", "p", "o", "s", "i", "t", "i", "o", "n"]

const c = a.split(" "); // ["selected", "position"]
const d = a.split("s"); //  ["", "elected po", "ition"]
d.join("m"); // "melected pomition"
```

### String.split(구분자)

입력받은 구분자를 기준으로 해당 구분자를 삭제되고 남은 문자열이 배열로 반환됨

### Array.join(구분자)

배열의 모든 요소들을 구분자로 연결해 하나의 문자열로 만듦

### String.replace()

string 원본 바뀌지 않음<br>

---

### 정규표현식

`문자 검색과 교체`할 때 사용함

**패턴과 플래그**

`패턴`
</br>
예시 `/q/`

슬래시를 사용하면 자바스크립트에게 정규 표현식을 생성하고 있다는 것을 알려줌

`플래그`

**검색에 영향을 주는 플래그**로 선택적으로 붙임

`i` 대,소문자 구분없이 검색

`g` 패턴과 일치하는 모든 것을 찾음(여러개)

`m`다중 행 모드를 활성화함

`s` .이 개행 문자 \n도 포함하도록 "dotall" 모드를 활성화함

`u` 유니코드 전체를 지원함

`y` 문자 내 특정 위치에서 검색을 진행하는 sticky모드를 활성화시킴
