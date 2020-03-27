---
title: React 준비사항
tags: ["React"]
cover: ready.jpg
author: mmyeon
---

### 1. 노드 설치 확인

> 터미널 > node -v

### 2. npm 설치 확인

> 터미널 > npm -v (node랑 같이 다운받아진다)

### 3. npx 설치하기(추가작업)

> npm install npx -g

### 4. git 설치

> git —version

---

<img src="./facebook.jpg">

### create react app (개발 세팅을 편하게 해줄 수 있는 툴킷)

- 브라우저가 리액트 코드를 이해하지 못하기 때문에 리액트 코드를 브라우저가 이해할 수 있도록 바꿔줘야 함. -> Webpack, Babel 필요
  > **create react app으로 명령 하나면 위의 복잡한 과정을 Set up할 수 있게 해줌.(툴킷사용)**

### 리액트코드 컴파일하기 (터미널 열기)

1. documents로 가기 **cd Documents**
2. **npx create-react-app (파일이름) movie_app_2020**
   - **npm(yarn)** 같은 의미
3. vsc로 파일열기 : **터미널 > code movie_app_2020**
4. README 내용 삭제하고 다시 작성하기

   > # Movie App 2020
   >
   > <br/>
   > React JS Fundermentals Course (2019 Update!)

5. package.json에서 **scripts에서 start, build 부분만 신경쓰기**

   ```json
   "scripts": {
     "start": "react-scripts start",
     "build": "react-scripts build"
   }
   ```

6. 첫번째 application 실행하기
   - VSC에서 터미널 실행(cmd + j)
     > npm start (컴파일해서 이제 로컬과 브라우저(url)에서 볼 수 있다.)

---

- 리액트는 자바스크립트 라이브러리 중 하나다. 라이브러리는 사용할 수 있도록 모듈, 패키지 된 것이다.

- npm : 노드패키지 매니저
