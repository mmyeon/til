---
title: 스타일드 컴포넌트로 미디어쿼리 사용하는 방법
tags: ["Styled Component"]
cover: styled.jpg
author: mmyeon
---

##  CSS처럼 스타일드 컴포넌트에서도 미디어 쿼리가 작동한다. 
~~~js
const CardWrapper = styled.div`
  display: flex;
  flex-direction: row;
  @media (max-width : 768px){
    flex-direction: column;
  }
`;
~~~

그렇다면 어떻게 <b>스타일드 컴포넌트</b>를 사용해서 <b>반응형</b>을 만들 수 있을까? 

`  1. 자바스크립트 객체로 브레이크 포인트 정의하기`<br>
`  2. 미디어 쿼리를 사용해서 브레이크포인트마다 장치 정의하기`<br>
 ` 3. 스타일드 컴포넌트에서 @media 규칙을 적용하기`<br>

## 1. 브레이크포인트와 장치를 정의하기
~~~js
const size = {
  mobileS: '320px',
  mobileM: '375px',
  mobileL: '425px',
  tablet: '768px',
  laptop: '1024px',
  laptopL: '1440px',
  desktop: '2560px'
}

~~~
그리고 나서 지원하는 장치마다 미디어 쿼리 만들기. 

~~~js
export const device = {
  mobileS: `(min-width: ${size.mobileS})`,
  mobileM: `(min-width: ${size.mobileM})`,
  mobileL: `(min-width: ${size.mobileL})`,
  tablet: `(min-width: ${size.tablet})`,
  laptop: `(min-width: ${size.laptop})`,
  laptopL: `(min-width: ${size.laptopL})`,
  desktop: `(min-width: ${size.desktop})`,
  desktopL: `(min-width: ${size.desktop})`
};
~~~

## 2. 장치 사이즈에 맞춰서 컴포넌트 업데이트하기
아래의 어플리케이션의 root는 다음의 계층으로 구성되어 있다. 
~~~js
const App = () => (
  <Page>
    <Hello name="CodeSandbox" />
    <Card withPictureOf="cats" />
    <Card withPictureOf="coffee" />
    <Card withPictureOf="oranges" />
  </Page>
);


~~~

페이지를 반응형으로 만드려면, 두 컴포넌트가 업데이트 되어야 한다. 

- `Page` 컴포넌트는 최대 width를 가져야 한다
- `Card` 컴포넌트는 작은 장치에서 글자 아래에 이미지가 위치해야 한다. 

페이지 컴포넌트의 경우, 장치 마다 `max-width`값을 설정한다

~~~js
import styled from 'styled-components';
import { device } from './device';

const Page = styled.div`
  margin: auto;
  font-family: "sans-serif";
  text-align: center;

  @media ${device.laptop} { 
    max-width: 800px;
  }

  @media ${device.desktop} {
    max-width: 1400px;
  }
`;
~~~
카드 컴포넌트의 경우 flex-direction을 업데이트한다


~~~js
import { device } from './device';

const CardWrapper = styled.div`
  display: flex;
  // Mobile friendly by default
  flex-direction: column;

  border: 1px solid gray;
  box-shadow: 5px 5px #ccc;
  padding: 10px;
  margin: 10px;

  // Switch to rows on large devices
  @media ${device.laptop} {
    flex-direction: row;
  }
`;
~~~



---

### 참고

[How to use media queries with styled components](https://jsramblings.com/how-to-use-media-queries-with-styled-components/)
