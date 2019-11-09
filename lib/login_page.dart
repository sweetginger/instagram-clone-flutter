import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'tab_page.dart';

/**
 * 구글로그인 버튼을 가진 로그인화면 구현
 */
class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // singletone pattern 인스턴스를 한번만 생성하도록 함
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Instagram Clone',
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
        Padding(
          padding: EdgeInsets.all(50.0),
        ),
        // 구글로그인 버튼을 눌렀을때 firebase auth google login 처리를 해서 TabPage에 유저정보를 넘겨주고 화면을 전환한다.
        // TabPage(user); : TabPage 클래스의 생성자 set 방식
        SignInButton(Buttons.Google, onPressed: () {
          _handleSignIn().then((user) {
            print(user);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => TabPage(user)));
          });
        })
      ],
    )));
  }

  /**
   *  FirebaseUser 타입을 리턴할 async 메소드 : 인증된 유저 정보를 반환한다.
   *  flutter firebase auth 매뉴얼 아래 링크 참고
   *  https://firebaseopensource.com/projects/firebaseextended/flutterfire/packages/firebase_auth/readme.md/
   *  */
  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    return user;
  }
}
