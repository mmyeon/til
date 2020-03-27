---
title: React 라이브러리 추가 - react-multi-carousel
tags: ["React"]
cover: carousel.jpg
author: mmyeon
---

### 마음에 드는 라이브러리 찾기

- Weekly Download 높은 라이브러리로,

* 데모 확인하기
* 참고 : [react-multi-carousel](https://www.npmjs.com/package/react-multi-carousel)

### 설치한 뒤 작동여부 확인하기

```bash
$ npm install react-multi-carousel --save
```

### 작업 세팅하기

```js
import Carousel from "react-multi-carousel";
import "react-multi-carousel/lib/styles.css";
const responsive = {
  superLargeDesktop: {
    // the naming can be any, depends on you.
    breakpoint: { max: 4000, min: 3000 },
    items: 5
  },
  desktop: {
    breakpoint: { max: 3000, min: 1024 },
    items: 3
  },
  tablet: {
    breakpoint: { max: 1024, min: 464 },
    items: 2
  },
  mobile: {
    breakpoint: { max: 464, min: 0 },
    items: 1
  }
};
<Carousel responsive={responsive}>
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
  <div>Item 4</div>
</Carousel>;
```

### 입맛에 맞게 커스텀하기

- 이미지가 아닌 BodyPart 컴포넌트로 수정

- 화살표 아이콘 보이지 않도록 수정 `arrows={false}`

- 아이템이 앞뒤로 반복적으로 돌아가지 않도록 루프 수정 `infinite={false}`

- 아이템 간격을 넓히고 싶어서 클래스를 추가함. 기존 CSS는 작동하지 않아서 헤매다 적용 `itemClass="carousel-item"`

  ```css
  .carousel-item {
    margin-right: 20px;
  }
  ```

---

### 적용된 코드

```js
<Carousel
  additionalTransfrom={0}
  arrows={false}
  autoPlaySpeed={3000}
  centerMode
  className=""
  containerClass="container"
  dotListClass=""
  draggable
  focusOnSelect={false}
  infinite={false}
  itemClass="carousel-item"
  keyBoardControl
  minimumTouchDrag={80}
  renderButtonGroupOutside={false}
  renderDotsOutside={false}
  responsive={{
    desktop: {
      breakpoint: {
        max: 3000,
        min: 1024
      },
      items: 3,
      partialVisibilityGutter: 40
    },
    mobile: {
      breakpoint: {
        max: 464,
        min: 0
      },
      items: 1,
      partialVisibilityGutter: 30
    },
    tablet: {
      breakpoint: {
        max: 1024,
        min: 464
      },
      items: 2,
      partialVisibilityGutter: 30
    }
  }}
  showDots={false}
  sliderClass=""
  slidesToSlide={1}
  swipeable
>
  {data.map((item, index) => (
    <BodyPart key={index} title={item.title} backgroundColor={item.backgroundColor} />
  ))}
</Carousel>
```

---

### 무엇을 배웠는가

- React에 대한 기본이 약하다보니 라이브러리 적용하는 부분을 이해하는 데 시간이 더 오래 걸렸다. 지금 읽고 있는 리액트 책을 더 붙잡아야 겠다.
- CSS가 왜 적용되지 않는지, 그렇다면 이 라이브러리는 어떤 옵션을 제공하는지를 배우는 시간이었다.
- 라이브러리 첫 사용!
