---
title: "nvm으로 원하는 node 버전 사용하기"
tags: ["NODE"]
cover: solve.jpg
author: mmyeon
---

## **Current Behavior**

기존에 만들었던 프로젝트를 다시 만들어보고 싶어서 `$ npx create-react-app 파일명` 을 입력했다. 그랬더니 노트 버전이 14이상이 되어야 한다는 경고문을 확인할 수 있었다. `$ node -v` 를 통해 노드 버전을 확인해보니 현재 v12.22.1을 사용하고 있었다.<br>

## **Steps to solve**

### 시도 1

노드 버전 업데이트라는 키워드로 구글링을 해서

```node.js
$ npm cache clean -f
$ npm install -g n
$ n lts;
```

을 시도했지만 sudo required (or change ownership, or define N_PREFIX)라는 에러를 만났다.<br>

### 시도 2

다시 검색해서 nvm으로 해결할 수 있었다.

> nvm은 여러 버전의 node.js를 설치하고 원하는 버전을 선택해서 사용할 수 있는 노드 버전 매니저를 뜻한다.

- nvm 설치

[GitHub - nvm-sh/nvm: Node Version Manager - POSIX-compliant bash script to manage multiple active node.js versions](https://github.com/nvm-sh/nvm#installing-and-updating)

설치 후 다음의 과정을 통해 노드 버전을 변경하면 된다!<br>

- 현재 제어하고 있는 버전 확인하기

`$ nvm list`

- 원하는 버전 사용하기

`$ nvm use v14.16.0`

- default 버전 변경하기

`$ nvm alias default v14.16.0`

### 무엇을 배웠는가

문제를 발견하고 현재 상황, 원하는 결과, 해결하기 위해 했던 방법들을 적으니 문제를 해결할 수 있었다. 예전에 블로그에 글로 남겨 놓았던 <a href="https://til.mmyeon.com/all-about-question/" target="_blank">질문하는 방법</a>과 연결된다는 생각이 들었다. 어떤 상황에서 어떤 문제를 만났고, 해결하기 위해서 어떤 노력을 했는지 **문맥**을 기록하면 누군가에게 도움을 요청할 때 빠르게 피드백을 받을 수 있겠다는 확신이 들었다. 적어도 상대가 나의 문제 상황에 대해 알기 위해 꼬리 물기 질문을 하는 수고로움을 줄이는 사람이 되자! 하는 다짐도 하게 되었다.

---

### 참고

[How To Update Node.js To Latest Version On Linux, macOS, & Windows](https://www.whitesourcesoftware.com/free-developer-tools/blog/how-to-update-node-js-to-latest-version/)

[nvm (Node version Manager) 로 여러 버전의 nodejs 사용하기](https://www.lesstif.com/javascript/nvm-node-version-manager-nodejs-82214944.html)

[자동등록방지를 위해 보안절차를 거치고 있습니다.](http://megaton111.cafe24.com/2020/12/23/nvm%EC%9D%84-%EC%9D%B4%EC%9A%A9%ED%95%9C-node-%EB%B2%84%EC%A0%84-%EB%B3%80%EA%B2%BD%ED%95%98%EA%B8%B0/)
