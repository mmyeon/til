---
title: "속성 선택자"
tags: ["HTML, CSS"]
cover: select.jpg
author: mmyeon
---

### 문제

원하는 속상값을 지닌 option태그를 알기 위해서 for문으로 속성값을 반복해서 확인했는데
속성 선택자를 사용하면 <b>주어진 속성의 존재 여부</b>나 <b>그 값에 따라 요소</b>를 선택할 수 있다.

<b>[attr=value]</br></b>
attr 이름의 속성값이 value인 요소

<h2>html</h2>

```html
<select class="js-select">
  <option value="NONE">--- Choose Your Country ---</option>
  <option value="KR">Korea</option>
</select>
```

```js
const option = document.querySelector(`option[value=${selected}]`);
```

<h2>css</h2>

```css
/* 타이틀 속성을 가진 a요소들  */
a[title] {
  color: purple;
}

/* 특정값과 매치되는 href를 가진 a요소들 */
a[href="https://example.org"] {
  color: green;
}

/* 특정 단어를 포함하는 href를 가지는 a요소들 */
a[href*="example"] {
  font-size: 2em;
}

/* ".org"로 끝나는 href를 가지는 a요소들 */
a[href$=".org"] {
  font-style: italic;
}

/* "logo"단어를 포함하는 class 속성을 가지는 a요소들 */
a[class~="logo"] {
  padding: 2px;
}
```
