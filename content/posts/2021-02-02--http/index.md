---
title: "HTTP 프로토콜"
tags: ["NETWORK"]
cover: til.jpg
author: mmyeon
---

## HTTP 프로토콜이란?

HTTP는 `HyperText Transfer Protocol`의 줄임말<br>
클라이언트와 서버가 서로 통신하기 위한 약속으로 TCP/IP 통신 위에서 동작한다.<br>
기본 포트는 80번이다.

### 왜 약속이 필요한가?

클라이언트와 서버 간에 데이터를 주고 받기 위해서는 방식에 대한 약속이 필요하기 때문이다.

### **여기서 클라이언트는?**

요청을 보내는 쪽이 클라이언트고 웹에서는 브라우저가 클라이언트이다.

## HTTP 프로토콜 특징

### **Stateless**

각각의 데이터 요청이 독립적으로 관리되어서 클라이언트의 상태정보(로그인이 되어있는지)를 알 수가 없다

### **Connectionless**

클라이언트에서 서버에 요청을 보내면 서버는 클라이언트에 응답을 하고 접속을 끊는 경향이 있다.

### 클라이언트의 상태를 알고 싶다면?

**만약 로그인을 하고 그 상태를 유지한 채로 웹 서비스를 제공하려면 어떻게 해야할까?**

`쿠키`와 `세션`을 활용한다.

---

## 쿠키

클라이언트 로컬에 저장되는 key-Value 쌍의 작은 데이터 파일

**구성 요소**

쿠키이름, 쿠키값, 만료시간, 전송할 도메인명, 전송할 경로, 보안연결여부, HttpOnly여부

**동작방식**

- 클라이언트가 서버에 로그인 요청함
- 서버는 클라이언트의 로그인 요청의 유효성을 확인하고(아이디 비밀번호 검사) 응답헤더에 `set-cookies: user=mallang`을 추가하여 응답함
- 클라이언트는 이후에 서버에 요청할 때 전달받은 `cookie: user=mallang`를 자동으로 요청헤더에 추가하여 요청합니다. 브라우저가 자동으로 쿠키값을 헤더에 추가해줘서 가능함

## 세션

브라우저가 종료되기 전까지 클라이언트의 요청을 유지하게 해주는 기술

**동작방식**

- 클라이언트가 서버에 로그인 요청함
- 서버는 클라이언트의 로그인 요청의 유효성을 확인하고 unique한 id를 sessionid라는 이름으로 저장함
- 서버가 응답할 때 응답헤더에 `set-cookie:sessionid:alskdksj`를 추가하여 응답함
- 클라이언트는 이후 서버에 요청할 때 전달받은 `sessionid:alskdksj` 쿠키를 자동으로 요청헤더에 추가하여 요청함
- 서버에서는 요청 헤더의 sessionid값을 저장된 세션저장소에서 찾아보고 유효한지 확인후 요청을 처리하고 응답함

---

## HTTP Request & HTTP Response

HTTP 프로토콜로 데이터 요청을 보내고 응답을 받는 과정

### **누가 요청하고 누가 응답하는가?**

클라이언트 = 요청을 보내는 쪽 = 웹에서는 브라우저<br>
서버 = 요청을 받는 쪽 = 데이터를 보내주는 원격지의 컴퓨터

## URL

Uniform Resource Locators
서버에 자원을 요청하기 위해 입력한 영문주소

`http://www.domain.com:1234/path/to/resource?a=b&x=y`

- http 프로토콜

- http://www.domain.com - 호스트(서버 컴퓨터의 위치)

- 1234 - 포트

- path/to/resource - 리소스 path

- ?a=b&x=y - query

## 포트

여러개의 프로그램이 작동중인 컴퓨터에게 어떤 프로그램에 접속할 것인지 컴퓨터에게 알려주는 방법
HTTP프로토콜에서 80포트는 웹서버 프로그램을 의미한다

## HTTP 요청 메서드

요청하는 데이터에 특정 동작을 추가하고 싶다면

- GET : 존재하는 자원에 대한 요청
- POST : 새로운 자원을 생성
- PUT : 존재하는 자원에 대한 변경
- DELETE : 존재하는 자원에 대한 삭제
- HEAD : 서버 헤더 정보를 획득, GET과 비슷하나 Response Body를 반환하지 않음
- OPTIONS : 서버 옵션들을 확인하기 위한 요청. CORS에서 사용

## HTTP 상태코드

서버에서 설정해주는 응답 정보
클라이언트가 보냈던 요청이 어떻게 처리되었는지 상태를 알려줌

### 200번대 - 성공

- 200 : GET 요청에 대한 성공
- 204 : No Content, 성공했으나 응답 본문에 데이터가 없음
- 205 : Reset Content, 성공했으나 클라이언트 화면을 새로 고침하도록 권고
- 206 : Partial Content, 성공했으나 일부 범위의 데이터만 반환

### 300번대 - 리다이렉션

클라이언트가 이전 주소로 데이터를 요청하여 서버에서 새 URL로 리다이렉트를 유도함

- 301 : Moved Permanently, 요청한 자원이 새 URL에 존재
- 303 : See Other, 요청한 자원이 임시 주소에 존재
- 304 : Not Modified, 요청한 자원이 변경되지 않았으므로 클라이언트에서 캐싱한 자원을 사용하도록 권고

### 400번대 - 클라이언트 에러

유효하지 않은 자원을 요청했거나 요청이나 권한이 잘못된 경우 발생

- 400 : Bad Request, 잘못된 요청
- 401 : Unauthorized, 권한 없이 요청. Authorization 헤더가 잘못된 경우
- 403 : Forbidden, 서버에서 해당 자원에 대해 접근 금지
- 405 : Method Not Allowed, 허용되지 않은 요청 메서드
- 409 : Conflict, 최신 자원이 아닌데 업데이트하는 경우. ex) 파일 업로드 시 버전 충돌

### 500번대 - 서버 에러

서버 쪽 오류

- 501 : Not Implemented, 요청한 동작에 대해 서버가 수행할 수 없는 경우
- 503 : Service Unavailable, 서버가 과부하 또는 유지 보수로 내려간 경우

### 요약

브라우저는 서버에게 HTTP Request(URL + 요청 메서드)를 보내고
서버는 브라우저에게 HTTP Response(응답 상태 코드 + 응답 Body)를 보낸다.

---

## 서버의 위치는 정말 naver.com일까?

### **DNS 도메인 네임 시스템**

모든 컴퓨터는 숫자를 사용하여 서로 찾고 통신함 = `IP주소`<br>
웹 브라우저에서는 IP주소 대신에 도메인 이름(naver.com)을 입력해도 원하는 사이트로 갈 수 있다.

**어떻게 가능하지?**

사람이 읽을 수 있는 이름을 입력받음 → 192.0.2.1과 같은 IP 주소로 변환하여 컴퓨터가 서로 통신할 수 있도록 함.
마치 전화번호부처럼 이름과 숫자를 매핑하는 기능임

---

## HTTP 캐싱

네크워크 상에서 무언가 가져오는건 모두 비용임.
따라서 이전 자원을 재사용하는 것은 성능 최적화에서 매우 중요함

**캐싱 정의**

캐싱은 주어진 리소스 복사본을 저장하고 있다고 요청 시에 서버로부터 리소스를 다시 다운로드 하는 대신 리소스 복사본을 제공하는 기술<br>

사용자가 웹사이트에 접속할 때 정적 컨텐츠(이미지, JS, CSS 등)을 특정 위치(client, network등)에 저장하여, 웹사이트 서버에 해당 컨텐츠를 매번 요청하여 다운 받는 것이 아니라 리소스 복사본을 제공받음

**캐싱의 장점**

모든 클라이언트를 서비스할 필요가 없어짐 → 서버의 부하 완화 → 성능 향상

**max-age**

`max-age=<seconds>`

리소스가 최신 상태라고 판단할 최대 시간을 지정함.
max-age 전까지는 서버에 요청하지 않고 클라이언트 저장공간에서 사용함

## HTTP와 HTTPS의 차이

HTTPS는 HyperText Tranfer Protocol Secure로 HTTP의 보안버전이다.
모든 통신 데이터가 암호화되어 있다.
보안이 되어 있기 때문에 id와 비밀번호가 암호화되어 전송된다.
HTTP의 경우는 데이터 암호화가 되어 있지 않기 때문에 중요한 데이터를 입력하는 것은 위험하다.

**HTTPS의 장점**<br>
보안상 장점과 더불어 검색 엔진 최적화에 유리함

## CORS 교차출처 리소스 공유

Cross-origin 리소스 공유는 한 도메인에서 로드되어 다른 도메인에 있는 리소스와 상호작용하는 클라이언트 웹 애플리케이션의 방법이다.
요청을 보내게 될 사이트가 현재 접속 사이트와 다르다면 요청이 실패할 수 있다

### 왜?

동일 출처 정책(same-origine policy) 떄문에 CORS 상황이 발생하면 외부 서버에 요청한 데이터를 브라우저에서 보안목적으로 차단하기 때문이다.

### 동일 출처 정책

불러온 문서나 스크립트가 다른 출처에서 가져온 리소스와 상호작용하는 것을 제한하는 중요한 보안방식으로 악성 문서를 격리하고 공격 경로를 줄이는데 도움이 된다.
따라서 CORS 요청을 허용하기 위해서는 cross-origin HTTP 요청을 허가해줘야 한다.

### Origin 출처

도메인 - 프로토콜 - 포트 세 가지에 의해서 결정된다.
도메인이나 프로토콜, 포트가 다른 곳에 요청을 보내는 것을 Cross-Origin Request(크로스 오리진 요청)라고 한다.

### Cross-Origin Resource Sharing

크로스 오리진 요청을 보낼 경우 브라우저는 항상 Origin이라는 헤더를 요청에 추가해야함

---

## 참고

[DNS란 무엇입니까? - DNS 소개 - AWS](https://aws.amazon.com/ko/route53/what-is-dns/)

[포트[PORT]에 대하여](https://run-it.tistory.com/19)

[HTTP와 HTTPS의 5가지 차이점 정리](https://whatismarketing.tistory.com/61)

[HTTP caching](https://developer.mozilla.org/ko/docs/Web/HTTP/Caching)

[[WEB] 쿠키, 세션이란?](https://chrisjune-13837.medium.com/web-%EC%BF%A0%ED%82%A4-%EC%84%B8%EC%85%98%EC%9D%B4%EB%9E%80-aa6bcb327582)

[웹 캐시(WEB Cache)란 무엇인가?(특징)](https://hahahoho5915.tistory.com/33)