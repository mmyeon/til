---
title: "box-shadow"
tags: ["CSS"]
cover: shadow.jpg
author: mmyeon
---

## box-shadow는 그림자 효과 추가하는 기능

`box-shadow : 수평거리, 수직거리 , 흐릿함 , (확산정도) , 그림자 색상`
<br>
inset 설정하면 요소가 움푹 들어간 것처럼 컨텐츠 내부에 그림자가 생김

```css
/* offset-x | offset-y | color */
box-shadow: 60px -16px teal;

/* offset-x | offset-y | blur-radius | color */
box-shadow: 10px 5px 5px black;

/* offset-x | offset-y | blur-radius | spread-radius | color */
box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);

/* inset | offset-x | offset-y | color */
box-shadow: inset 5em 1em gold;

/* Any number of shadows, separated by commas */
box-shadow: 3px 3px red, -1em 0 0.4em olive;

/* Global keywords */
box-shadow: inherit;
box-shadow: initial;
box-shadow: unset;
```
