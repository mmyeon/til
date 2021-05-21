---
title: export와 export default의 차이
tags: ["REACT"]
cover: export.jpg
author: mmyeon
---

## [오늘의 질문😄] export와 export default의 차이는 뭐지?

export default를 사용하지 않아서 생긴 오류를 개선하면서 둘의 차이에 대해 알게되었다.

---

<br>

`export`/`import`는 ES6 모듈 시스템의 일부분이다. import구문으로 모듈에서 가져온 함수, 객체, 값을 다른 프로그램에서도 `재사용하기 위해서` import 구문을 사용하고, 다른 모듈에 노출하기 위해서 export구문을 사용한다

## import

```js
import React from "react";
```

## export

```js
export default HelloWorld;
```

예시를 통해 import와 export의 의미를 살펴보자

```js
// 리액트 모듈에서 React 객체를 가져온다.
import React from "react";

const HelloWorld = () => {
  return <p>Hello,World!</p>;
};

// HelloWorld 컴포넌트를 다른 모듈에 노출한다.
export default HelloWorld;
```

<br>

`ES6`에는 두 종류의 export가 존재한다

## Named exports

- func의 이름을 가진 export를 import할 때, <b>export된 이름과 같은 이름을 사용해야만 한다.</b>
- <b>한 모듈에 export를 여러번 할 수 있다.</b>

```js
export function func() {}
```

```js
import { func } from "module";
import { exportName } from "module";
```

## Default exports

- 모듈로부터 import되는 값을 의미한다.
- <b>import할 때 로컬 변수에 값, 객체, 함수를 할당하기 때문에 export이름과 같지 않아도 된다.</b>
- <b>export default는 모듈당 한번만 가능하다.</b>

```js
export default { NavList, NavItem, NavToggleIcon, NavButtonInner, Container };
```

```js
import Styled from "./index.styles";
```

## 두 개를 동시에 쓰려면?

```js
import defaultExport, { namedExport1, namedExport3, etc... } from "module";
```

---

### 참고

[What does “export default” do in JSX?](https://stackoverflow.com/questions/36426521/what-does-export-default-do-in-jsx/36426988)
