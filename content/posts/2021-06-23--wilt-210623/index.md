---
title: "210623 _ 오늘의 기록"
tags: ["WILT"]
cover: wilt.png
author: mmyeon
---

![what i learned today](./wilt.png)

### 커밋 메세지 쓸 때 매우 구체적으로 정확히 쓰기

> `라우트 설치` 보다는 `react-router-dom 설치`

프로젝트에서 라우트 설정하기 위해서 react-router-dom 설치를 한다고 생각하고 react-router를 설치했다. 이후에 다른 작업을 하다가 발견하게 된 실수인데 커밋 메세지에는 라우트라고만 적혀있으니까 정확히 무엇을 설치했는지 드러나지 않아서 알아내는데 시간이 조금 걸렸다. 커밋 메세지를 정확하게 기록해놓았다면 더 빠르게 해결할 수 있었을텐데라는 생각과 정말 실수는 생각지 못한 곳에서 오는구나라는 생각이 들었다. 이번 경험으로 시간이 지나도 무슨 작업을 했는지 정확하게 알 수 있도록 커밋 메세지를 작성하자고 다짐했다.

### 사용자 정의 컴포넌트는 무조건 대문자로 시작해야 한다

프로젝트를 하다 두번이나 경험한 부분인데 엇 스타일드 컴포넌트 스타일이 안 먹히네? 왜 그러지? 뭐가 문제지? 물음표의 늪에 빠졌다. 설마 컴포넌트가 소문자로 시작해서 생긴 문제라고는 전혀 생각하지 못했다. 리액트 문서를 읽어보니 대문자가 아닌 소문자로 시작하는 경우에는 `<div>`처럼 HTML 태그로 인식하기 때문에 반드시 컴포넌트는 대문자화 해야한다고 적혀있었다. 이제 이런 실수 다신 안하겠지!
