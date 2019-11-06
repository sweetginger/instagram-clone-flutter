# instagram_clone

## 1. 로그인 여부에 따라 페이지 분기

[ RootPage ]
Login ? TabPage : LoginPage

## 2. 탭페이지 구현

원하는 클래스 요소 API docs는 아래 링크 참조

https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html

### 2-1) 첫번째 탭 Home

로그인 유저 프로필 레이아웃만 표현함 (StatelessWidget)

사용한 옵션

- Scaffold
- Column
- Row
- NetworkImage, Image.network
- Text
- RaisedButton
- Card
- SizedBox

### 2-2) 두번째 탭 Search

유저가 등록한 게시물을 표현함 (StatefulWidget)

사용한 옵션

- Scaffold
- Image
- GridView
- FloatingButton

### 2-3) 세번째 탭 Account

로그인 유저 피드 타이틀만 표현함.
게시물 등록 수가 변화됨 (StatefulWidget)

사용한 옵션

- Scaffold
- FloatingButton
- Stack
