import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

/**
 * Account 탭에 표현할 화면 구현
 */
class AccountPage extends StatefulWidget {
  final FirebaseUser user;
  AccountPage(this.user);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar를 별도 메소드로 분리함
        appBar: _buildAppBar(),
        // body를 별도 메소드로 분리함
        body: _buildBody());
  }

  // Widget을 리턴하는 메소드
  Widget _buildAppBar() {
    return AppBar(actions: <Widget>[
      // 로그아웃 처리
      IconButton(
        icon: Icon(Icons.exit_to_app),
        onPressed: () {
          FirebaseAuth.instance.signOut();
          _googleSignIn.signOut();
        },
      )
    ]);
  }

  // Widget을 리턴하는 메소드
  Widget _buildBody() {
    // body 안에 전체적으로 4방향 패딩을 줌
    return Padding(
        padding: EdgeInsets.all(16.0),
        // row는 배열
        child: Row(
          // crossAxisAlignment : row 시작부분 (왼쪽기준) 으로 정렬. 이 옵션을 주지 않으면 가로100%로 먹힘
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment.spaceBetween : 요소들 간에 적절히 공간을 띄어줌
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                // Stack : 겹치는 레이아웃을 구현함.
                //         처음에 기술하면 맨아래 깔리고 그 다음 기술하는 요소는 그 위에 레이어가 올라감.
                Stack(
                  children: <Widget>[
                    // SizedBox : 사이즈를 정함
                    SizedBox(
                        width: 80.0,
                        height: 80.0,
                        // CircleAvatar : 원형 아바타
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(widget.user.photoUrl),
                        )),
                    // 아바타 위에 올릴 add버튼 위치를 bottomRight에 두기 위해 Container를 아바타와 같은 크기로 만듬
                    Container(
                        width: 80.0,
                        height: 80.0,
                        // bottomRight 에 배치
                        alignment: Alignment.bottomRight,
                        child: Stack(
                          // stack 안의 자식들을 center정렬함
                          alignment: Alignment.center,
                          children: <Widget>[
                            // add 버튼에 테두리효과를 주기위해 add버튼보다 조금큰 하얀 원을 밑에 깔아줌
                            SizedBox(
                                width: 27.0,
                                height: 27.0,
                                child: FloatingActionButton(
                                  // onPressed: null  눌렀을때 액션 없음
                                  onPressed: null,
                                  backgroundColor: Colors.white,
                                )),
                            // FloatingActionButton 사이즈를 정하여 만듬
                            SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: FloatingActionButton(
                                    // onPressed: null  눌렀을때 액션 없음
                                    onPressed: null,
                                    backgroundColor: Colors.blue,
                                    child: Icon(Icons.add)))
                          ],
                        ))
                  ],
                ),
                // Padding : 간격을 줌
                Padding(
                  padding: EdgeInsets.all(6.0),
                ),
                Text(widget.user.displayName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0))
              ],
            ),
            // Text 안에 \n 가능
            Text('0\nPosts',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),
            Text('0\nFollowers',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),
            Text('0\nFollowing',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),
          ],
        ));
  }
}
