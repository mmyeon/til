---
title: Project settings
tags: ["clone-coding", "git"]
cover: IMG_5290.jpg
author: mmyeon
---

## 프로젝트 시작하기 전 기본 세팅

1. **terminal** 열어서 로컬에 프로젝트 만들기

   - pwd : 현재 위치 알아보기
   - cd Workspace
     > cd 입력하면 디렉토리가 바뀝니다. 이때 원하는 위치로 갈때 tab을 누르면 자동완성됩니다.
     > ls 입력하면 현재 파일 리스트를 볼 수 있습니다.
   - **mkdir** 원하는 파일명 : 디렉토리 만들기
   - cd 파일명 : 디렉토리로 이동
   - code . : 현재위치폴더 코드를 열어주세요
     > 역시 tab 누르면 가능한 폴더 보여줍니다.
   - 터미널 종료

2. **vsc** 작업

   - new file 누른 뒤 README.md 파일 만들기
     > cmd + k , + v 로 미리 보면서 작업하세요.

3. **github**에 접속합니다.

   - repository > new repository > repository 이름 입력
   - **vcs 터미널로 돌아오기**
     - git init ( git 초기화 )
     - git add . (폴더 속 모든 파일을 인덱스에 올림)
     - git commit -m "Initialize Project"
     - git remote add origin 원격주소입력
     - git push -u origin master (local master -> origin master)
       > git status로 파일 상태 확인 가능합니다.

4. **소스트리** 클릭

   - new > scan > workspace > 원하는 repository 선택 > add repository

5. **vsc** 작업 시작 : 파일 만들기
   -index.html
   -js/index.js
   -styles/style.css
