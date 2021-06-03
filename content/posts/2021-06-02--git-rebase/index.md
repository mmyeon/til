---
title: "커밋 히스토리 깔끔하게 merge하는 방법"
tags: ["Git"]
cover: basic-rebase-3.png
author: mmyeon
---

## 왜 궁금해졌나요?

프로젝트를 진행하다가 브랜치를 merge하기 위해서 `git merge`를 하자 <br>
`Merge branch 'refactor' into main`라는 새로운 커밋 메세지가 생다.
좀 더 깔끔하게 커밋메세지 없이 merge하고 싶어서 알아보다가 rebase에 대해 배웠다.

---

## 새롭게 알게 된 사실들

### 브랜치를 merge하는 방법은 2가지이다

✅ git merge <br>
✅ git rebase

### 브랜치가 필요한 순간은?

- 메인 브랜치에서 작업을 하다 refactor 작업이 필요해서 브랜치를 새로 만들 때
- refactor 작업을 하다가 급하게 처리해야 할 hotfix가 발생했을 때

### merge 하기 전 체크하기

- 아직 커밋하지 않은 파일이 남아있으면 checkout할 때 branch 변경이 안될 수 있다. 따라서 <b>브랜치를 변경하기 전에 워킹 디렉토리를 정리(commit 이나 stashing)</b>하는 습관을 가져야한다.

### git merge에서 fast-forward의 의미

`merge할 브랜치(hotfix)`가 가리키는 커밋이 `main 브랜치` 커밋보다 앞에 있어서 단순하게 포인터만 앞으로 이동하면 된다. 브랜치가 갈라지지 않고 포인터만 이동하는 merge를 뜻한다.

### 필요없는 브랜치는 삭제하기

`$ git branch -d 브랜치이름`

### branch에서 작업한 부분은 merge해야 반영된다

각 개별 브랜치의 변경사항은 merge하기 전에는 서로의 작업에 대해 모른다. 각 브랜치는 독립적으로 작업을 한다.

### 같은 파일의 한 부분을 수정한 브랜치들을 merge한다면?

git은 어느 부분을 기준으로 merge할 지 모르기 때문에 충돌이 발생한다. 코드 수정이 필요하다.

## Git merge = 3 way merge

![merge screenshot](./basic-rebase-1.png)
![merge screenshot](./basic-rebase-2.png)

- merge해 올 브랜치가 merge할 브랜치(master)의 조상이 아니므로 fast-forward가 불가할 때 사용하는 방법

- 각 브랜치가 가리키는 커밋 두개와 공통 조상을 사용해서 merge하는 방법

- 3 way merge를 완성하는 커밋을 별도로 하나 만들어서 main 브랜치가 그 커밋을 가리키게 된다.

---

## Git rebase

- 한 브랜치에서 커밋한 모든 변화를 가져다가 다른 branch에 재연하는 merge 방법

```bash
$ git checkout refactor
$ git rebase main
$ git checkout main
$ git merge refactor
```

### Git rebase 작동원리

![merge screenshot](./basic-rebase-3.png)
![merge screenshot](./basic-rebase-4.png)

- 두 브랜치의 공통 조상으로 가서 각 브랜치의 변경사항을 저장해서 rebase한 브랜치(master 브랜치)에서 변경사항을 차례로 적용한다. 이후에 `master 브랜치`를 fast-forward한다.

### Git rebase의 장점

- 모든 작업이 차례대로 수행된 것 같은 커밋 히스토리를 가진다.
- 커밋 히스토리가 깔끔하다.

### Git rebase 주의사항

- <b>이미 push된 커밋은 rebase 할지 말기</b>

- 항상 push 하기 전에 rebase 완료하기

---

## 회고

- 프로젝트하다 만난 부분이라 그냥 넘어갈 수 있었는데 궁금해서 `git rebase`에 대해서 공부해보았다. 혼자 프로젝트 할 때는 commit과 push만 사용해서 몰랐는데 문서를 읽으면서 git을 통해서 어떻게 협업이 가능한 지 알게 되어서 좋았다.

## 참고

[Git - Rebase 하기](https://git-scm.com/book/ko/v2/Git-%EB%B8%8C%EB%9E%9C%EC%B9%98-Rebase-%ED%95%98%EA%B8%B0)
