---
title: Storage 객체
tags: ["JS"]
cover: storage.jpg
author: mmyeon
---

## Storage 객체는 단순한 key-value 저장소

- 웹 어플리케이션은 유저의 브라우저 안에 데이터를 저장함.
- key/value데이터를 안전하게 저장할 수 있는 메커니즘 제공
- key와 value는 항상 문자열
- 웹사이트 퍼포먼스에 영향주지 않고 많은 양의 데이터를 저장할 수 있음.

---

## 쿠키와 스토리지의 차이

- HTML5 이전에는 쿠키에 저장되었음.
- 쿠키와 달리 스토리지는 리미트가 더 크고 정보는 절대 서버로 전달되지 않음.

---

## The sessionStorage Object

- 페이지의 세션이 유지되는 동안 사용할 수 있는 각 origin별로 별도의 스토리지를 관리함.
- 브라우저 탭이 닫히면 데이터도 사라짐

```html
<!DOCTYPE html>
<html>
  <head>
    <script>
      function clickCounter() {
        if (typeof Storage !== "undefined") {
          if (sessionStorage.clickcount) {
            sessionStorage.clickcount = Number(sessionStorage.clickcount) + 1;
          } else {
            sessionStorage.clickcount = 1;
          }
          document.getElementById("result").innerHTML =
            "You have clicked the button " +
            sessionStorage.clickcount +
            " time(s) in this session.";
        } else {
          document.getElementById("result").innerHTML =
            "Sorry, your browser does not support web storage...";
        }
      }
    </script>
  </head>
  <body>
    <p><button onclick="clickCounter()" type="button">Click me!</button></p>
    <div id="result"></div>
    <p>Click the button to see the counter increase.</p>

    <p>
      Close the browser tab (or window), and try again, and the counter is reset.
    </p>
  </body>
</html>
```

---

## The localStorage Object

- 브라우저가 닫히거나 다시 열리더라도 유지함

---

## Storage.getItem()

- 키의 이름을 넘기면, 키 값이 반환됨

## Storage.setItem()

- 키 이름과 값을 지정하여 스토리지에 저장
- 만약 키가 이미 존재한다면, 키의 값을 업데이트함

---

## 참고

[HTML5 Web Storage](https://www.w3schools.com/html/html5_webstorage.asp)
