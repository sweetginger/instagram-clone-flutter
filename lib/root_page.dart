import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'tab_page.dart';

/**
 * 로그인 여부에 따라 페이지 분기
 */
class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // StreamBuilder : 데이터의 변경에 따라 반응하도록 만들 수 있음
    // 여기서는 FirebaseUser 타입의 데이터 변경을 감지함
    return StreamBuilder<FirebaseUser>(
        // AsyncSnapshot : FirebaseUser의 데이터 스냅샷이 들어옴
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        // 스냅샷 데이터가 있으면 탭페이지로 연결
        // 여기서 snapshot.data 의 리턴타입은 dynamic 인데, dynamic 타입은 java의 Object와 같다.
        // 앱 실행시 로그인유저 정보가 있으면 탭페이지로 연결되고, 유저정보가 없으면 로그인페이지로 연결됨.
        return TabPage(snapshot.data);
      } else {
        // 스냅샷 데이터가 없으면 ~~~
        return LoginPage();
      }
    });
  }
}
