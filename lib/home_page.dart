import 'package:flutter/material.dart';

/**
 * Home 탭에 표현할 화면 구현
 */
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Instagram Clone',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      )),
      /* body 위젯을 별도로 분리한다. */
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
        // 전체에 4방향 균일하게 패딩을 줌
        padding: EdgeInsets.all(8.0),
        // 여기서 SafeArea는 아이폰의 상단 패인 프레임에 겹치지않게 영역을 지켜줌
        child: SafeArea(
            // 넘칠경우 스크롤 적용
            child: SingleChildScrollView(
                child: Center(
          // 컬럼은 배열방식으로 사용됨
          child: Column(
            children: <Widget>[
              Text(
                'Instagram에 오신 것을 환영합니다.',
                style: TextStyle(fontSize: 24.0),
              ),
              // 텍스트 사이에 패딩 간격을 줌
              Padding(padding: EdgeInsets.all(8.0)),
              Text(
                '사진과 동영상을 보려면 팔로우하세요.',
                style: TextStyle(fontSize: 12.0),
              ),
              Padding(padding: EdgeInsets.all(16.0)),
              // 사이즈를 정해놓은 박스
              SizedBox(
                  width: 260.0,
                  // Card 타입으로 프로필 표현
                  child: Card(
                      // elevation : 카드에 그림자효과 적용
                      elevation: 4.0,
                      // Card 안에 균일하게 4방 패딩을 적용
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              // 카드 안에 사용자이미지를 사이즈를 정하여 표현
                              SizedBox(
                                  width: 80.0,
                                  height: 80.0,
                                  child: CircleAvatar(
                                    // NetworkImage를 쓰면 웹 이미지 주소를 불러올 수 있음. Image.network('src')와 같다.
                                    backgroundImage: NetworkImage(
                                        'https://avatars0.githubusercontent.com/u/11537514?s=460&v=4'),
                                  )),
                              Padding(padding: EdgeInsets.all(8.0)),
                              Text('hyr2902@gmail.com',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Padding(padding: EdgeInsets.all(4.0)),
                              Text('황유림'),
                              Padding(padding: EdgeInsets.all(8.0)),
                              // Row는 배열방식으로 사용
                              Row(
                                // 행 공간 내에서 가운데정렬
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // 사이즈를 정해놓기 위해 SizedBox 사용
                                  SizedBox(
                                      width: 70.0,
                                      height: 70.0,
                                      // NetworkImage('src') == Image.network('src')
                                      // 이미지 비율을 강제로 크롭하여 정사각으로 표현하려면 아래처럼 옵션을 주면 된다.
                                      child: Image.network(
                                          'https://images.mypetlife.co.kr/content/uploads/2019/04/11132622/dog-3397110_960_720.jpg',
                                          fit: BoxFit.cover)),
                                  Padding(padding: EdgeInsets.all(1.0)),
                                  SizedBox(
                                      width: 70.0,
                                      height: 70.0,
                                      child: Image.network(
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Golde33443.jpg/280px-Golde33443.jpg',
                                          fit: BoxFit.cover)),
                                  Padding(padding: EdgeInsets.all(1.0)),
                                  SizedBox(
                                      width: 70.0,
                                      height: 70.0,
                                      child: Image.network(
                                          'http://ninedog.cafe24.com//web/img/dogunderstand/fr1.jpg',
                                          fit: BoxFit.cover))
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(2.0)),
                              Text('Facebook 친구'),
                              Padding(padding: EdgeInsets.all(8.0)),
                              // RaisedButton : 구글 Material Button
                              RaisedButton(
                                child: Text('Follow'),
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                                onPressed: () {},
                              ),
                            ],
                          )))),
            ],
          ),
        ))));
  }
}
