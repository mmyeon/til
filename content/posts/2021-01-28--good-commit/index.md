---
title: "알아두면 좋은 커밋 메세지 작성요령"
tags: ["Git"]
cover: til.jpg
author: mmyeon
---

## 모두에게 친절한 커밋메세지를 작성하자

> type: Subject
>
> body(detail)

## 타입

- `feat` : 새로운 기능 추가
- `fix` : 버그 수정
- `docs` : 문서 변경
- `style`
- `refactor` : 리팩토링
- `test` : production code에는 변화없지만 테스트 코드를 추가함
- `update` : 버전 업데이트

## About subject

- 제목 시작은 **대문자**로
- 마지막에 **마침표 없이**
- **명령문으로** 기록하기

## About detail

**무엇**을, **왜** 했는가를 기록하기

## 적절한 제목인지 판단하는 규칙

> "만약 이 커밋이 적용되면 이커밋은 `{커밋 제목행을 여기에}`”

- *만약 이 커밋이 적용되면 이 커밋은* **가독성을 위해 서브시스템X를 리팩토링한다**
- *만약 이 커밋이 적용되면 이 커밋은* **Getting Started 문서를 갱신한다**
- *만약 이 커밋이 적용되면 이 커밋은* **Deprecated된 메소드를 삭제한다**
- *만약 이 커밋이 적용되면 이 커밋은* **버전 1.0.0으로 판올림한다**

## 좋은 커밋 메세지의 예시

> \$ git commit -m `"가독성을 위해 회원가입 API 뷰셋 클래스를 리펙토링 한다"`

> \$ git commit -m `"회원정보 수정 내역 API 뷰셋이 RetrieveViewSet 클래스를 상속하도록 수정한다`
>
> 회원정보 수정 내역 조회 API URI를 설계를 /audit/user/{user_no} 형태로 변경한다.
> 그리고 외부에 제공되지 않기 때문에 기본 퍼미션 클래스를 적용한다.`

---

### 참고

[Guide to better Git](https://jonnung.dev/git/2018/01/02/guide-to-better-git-commit-message/)<br>
