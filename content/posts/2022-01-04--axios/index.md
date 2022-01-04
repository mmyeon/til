---
title: "axios로 API 호출하기"
tags: ["REACT"]
cover: solve.jpg
author: mmyeon
---

### 강아지 이미지 가져오는 API 호출하기

```jsx
import axios from "axios";

// axios 새로운 인스턴스 만들기
const api = axios.create({
  baseURL: "https://api.unsplash.com/",
  params: {
    client_id: process.env.REACT_APP_UNSPLASH_KEY
  }
});

// get 요청 날리기
export const getDogImageApi = () =>
  api.get("search/photos", {
    params: {
      query: "dog",
      page: Math.floor(Math.random() * 100)
    }
  });

export default api;
```

### axios가 건네 준 데이터 async await로 비동기 처리하기

```jsx
async function getData() {
  try {
    const {
      data: { results: apiResult }
    } = await getDogImageApi();
    const imagesURL = apiResult.map(item => item.urls.small);
    setImgUrlList(imagesURL);
  } catch (error) {
    console.log("failed");
  }
}
```

### 컴포넌트 마운트 하자마자 getData 호출하기

```jsx
useEffect(() => {
  getData();
}, []);
```

---

### 참고

[axios/axios](https://github.com/axios/axios)
