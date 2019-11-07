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

## 3. Create 페이지 구현

유저가 게시물을 등록한다.

### 3-1) 외부 라이브러리 적용

pubspec.yaml 파일 내 dependencies 에 기술하면 vscode에서 자동으로 flutter pub get 명령어를 실행하여 라이브러리를 받아준다.

외부 라이브러리는 flutter image picker 이런 예로 검색하거나,
https://pub.dev/packages/image_picker 에서 검색 가능.

pubspec.yaml 파일을 수정했을때는 라이브러리를 받은 후 앱을 재시작해줘야 반영된다.

--- 참고사항
image picker 라이브러리 사용시 에러가 발생할 경우 /android/app/build.gradle 파일에서 android/compileSdkVersion 28, android/defaultConfig/minSdkVersion 21 로 설정하면 해결됨.

## 4. Login 페이지 구현

구글 로그인 기능을 구현하여 로그인한다.

외부 로그인 버튼은 직접 만들수도 있고, 라이브러리를 사용하여 표현할 수도 있다.

이 프로젝트에서는 외부 로그인버튼 라이브러리를 사용한다.

pubspec.yaml 파일 내 dependencies에 flutter_signin_button
