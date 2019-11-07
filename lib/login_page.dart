import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

/**
 * 구글로그인 버튼을 가진 로그인화면 구현
 */
class LoginPage extends StatelessWidget {
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
        SignInButton(Buttons.Google, onPressed: () {})
      ],
    )));
  }
}
