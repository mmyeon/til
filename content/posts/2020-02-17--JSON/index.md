---
title: JSON
tags: ["JS"]
cover: json.jpg
author: mmyeon
---

## JSON

### JavaScript Object Notation

- 형식이 서로 다른 언어들과 연동하기 위한 목적에서 만들어진 **데이터 표준**
- 서버와 통신을 해서 작업을 해야할 때 중요
- 배열, 객체상태 그대로 전달해주는 역할을 함

```js
const json = '{"result":true, "count":42}';
const obj = JSON.parse(json);

console.log(obj);
//{result: true, count: 42} //객체
//count: 42
//result: true
//__proto__: Object

console.log(json);
//{"result":true, "count":42} //문자열

console.log(json.result);
//undefined

console.log(obj.result);
//true

for (var name in obj) {
  console.log(name, obj[name]);
}
//result true
//count 42
```

---

## JSON API

### JSON.parse()

**JSON 포맷의 문자열**을 인자로 전달하면 **자바스크립트 데이터로** 변환

### JSON.stringify()

**자바스크립트의 데이터를** 인자로 전 달하면 **JSON 포맷에 맞는 문자열로** 변환

```js
console.log(JSON.parse('{ "x": 5, "y": 6 }'));
// {"x":5,"y":6}

console.log(JSON.stringify({ x: 5, y: 6 }));
// "{"x":5,"y":6}"
```

---

## Ajax와 JSON

- JSON을 이용해서 Ajax통신하기

### 서버와 클라이언트가 어떻게 JSON을 통해서 서로 통신할까?

**서버** : 배열 → JSON 포맷의 문자열로 만들어서 클라이언트쪽으로 전송(다른 언어의 규칙으로 쓰인 배열을 직접 전달할 수 없으므로)

**클라이언트** : 받은 JSON 포맷의 문자열 → 배열(프로그래밍적으로 사용하기 위해 문자로 만듦)

---

## 참고

[JSON - 생활코딩](https://opentutorials.org/course/1375/6844)
