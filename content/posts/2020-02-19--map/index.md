---
title: Array.map()
tags: ["JS"]
cover: array.jpg
author: mmyeon
---
## Array.map()

- 배열의 모든 요소에 주어진 함수를 실행한 뒤 결과를 모아 배열로 반환함.
~~~js
    const friends = ["dog", "cat", "bird", "elephant"]
    
    friends
    // (4) ["dog", "cat", "bird", "elephant"]


    
    friends.map(friend => {return friend + "🥰"});
    // (4) ["dog🥰", "cat🥰", "bird🥰", "elephant🥰"]
    //함수에서 {} 사용하면 반드시 return 해야함!!!
    
    
    friends.map(friend => friend + "🥰");
    (4) ["dog🥰", "cat🥰", "bird🥰", "elephant🥰"]
 ~~~