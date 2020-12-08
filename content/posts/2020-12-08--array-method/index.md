---
title: "자주쓰는 배열 메서드"
tags: ["JS"]
cover: sort.jpg
author: mmyeon
---

### 배열 요소(item) 추가

- `arr.unshift(...items)` – 맨 앞에 요소 추가
- `arr.push(...items)` – 맨 끝에 요소 추가

### 배열 요소 제거

- `arr.shift()` – 맨 앞 요소 제거
- `arr.pop()` – 맨 끝 요소 제거

### 요소를 더하거나 지우기

- `splice(pos, deleteCount, ...items)` – pos부터 deleteCount개의 요소를 지우고, items 추가하기

```js
// 요소 삭제 및 그 자리를 다른 요소로 교체
let arr = ["I", "study", "JavaScript", "right", "now"];

// 처음(0) 세 개(3)의 요소를 지우고, 이 자리를 다른 요소로 대체함
arr.splice(0, 3, "Let's", "dance");

alert(arr); // now ["Let's", "dance", "right", "now"]
```

<br>

- `slice(start, end)` – start부터 end 바로 앞까지의 요소(end 요소 포함 안함)를 복사해 새로운 배열을 만듦

```js
// 기존의 배열을 건드리지 않으면서 배열을 조작해 새로운 배열을 만들고자 할 때 자주 사용

let arr = ["I", "study", "JavaScript", "right", "now"];

let copiedArr = arr.slice();

alert(copiedArr); // ["I", "study", "JavaScript", "right", "now"];
```

- `concat(...items)` – 배열의 모든 요소를 복사하고 items를 추가해 새로운 배열을 만든 후 이를 반환함. items가 배열이면 이 배열의 인수를 기존 배열에 더해줌, 배열 + 배열

### 원하는 요소 찾기

- `indexOf/lastIndexOf(item, pos)` – `pos`부터 원하는 `item`을 찾음. 찾게 되면 해당 요소의 인덱스를, 아니면 `1`을 반환함
- `includes(value)` – 배열에 `value`가 있으면 `true`를, 그렇지 않으면 `false`를 반환함, 요소의 존재 여부만 확인함
- `find/filter(func)` – `func`의 반환 값을 `true`로 만드는 첫 번째/전체 요소를 반환함
- `findIndex`는 `find`와 유사함. 다만 요소 대신 인덱스를 반환함

### 배열 전체 순회하기

- `forEach(func)` – 모든 요소에 `func`을 호출함. <b>결과는 반환되지 않음</b>

### 배열 변형하기

- `map(func)` – 모든 요소에 `func`을 호출하고, 반환된 결과를 가지고 새로운 배열을 만듦
- `sort(func)` – 배열을 정렬하고 정렬된 배열을 반환함
- `reverse()` – 배열을 뒤집어 반환함
- `split/join` – 문자열을 배열로, 배열을 문자열로 변환함
- `reduce(func, initial)` – 요소를 차례로 돌면서 `func`을 호출함. 반환값은 다음 함수 호출에 전달함. 최종적으로 하나의 값이 도출됨

```js
// 인수로 넘겨주는 함수는 배열의 모든 요소를 대상으로 차례차례 적용되는데,
// 적용 결과는 다음 함수 호출 시 사용됩니다.

let arr = [1, 2, 3, 4, 5];

let result = arr.reduce((sum, current) => sum + current, 0);

alert(result); // 15
```

### `reduce 작동 원리`

- 함수 최초 호출 시, `reduce`의 마지막 인수인 `0(초깃값)`이 `sum`에 할당됩니다. `current`엔 배열의 첫 번째 요소인 `1`이 할당됩니다. 따라서 함수의 결과는 `1`이 됩니다.
- 두 번째 호출 시, `sum = 1` 이고 여기에 배열의 두 번째 요소(`2`)가 더해지므로 결과는 `3`이 됩니다.
- 세 번째 호출 시, `sum = 3` 이고 여기에 배열의 다음 요소가 더해집니다. 이런 과정이 계속 이어집니다.

### 기타

- `Array.isArray(arr)` – arr이 배열인지 여부를 판단함

```js
// 배열도 객체에 속하기 떄문에 typeof로는 일반 객체와 배열을 구분할 수가 없다

alert(typeof {}); // object
alert(typeof []); // object

alert(Array.isArray({})); // false
alert(Array.isArray([])); // true
```

### 기존 배열을 변형시키는 메서드

`sort`, `reverse`, `splice`

---

### 참고

[배열과 메서드](https://ko.javascript.info/array-methods)
