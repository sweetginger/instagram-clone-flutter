import 'package:flutter/material.dart';

/**
 * Search 탭에 표현할 화면 구현
 */
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body를 별도 메소드로 분리함
      body: _buildBody(),
      // 플로팅버튼으로 등록버튼을 만듬
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }

  // Widget을 리턴하는 메소드
  Widget _buildBody() {
    // GridView 리턴
    return GridView.builder(
        // gridDelegate : 그리드 규격 정하기
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // crossAxisCount : 한줄에 3개
            crossAxisCount: 3,
            // childAspectRatio : 그리드의 각 요소 비율은 1.0 으로 정방형
            childAspectRatio: 1.0,
            // mainAxisSpacing, crossAxisSpacing : 그리드 행열 사이에 간격을 줌
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0),
        // 아이템 개수 5개로 지정
        itemCount: 5,
        // 그리드 아이템 만들기. itemBuilder 에 마우스오버하면 (BuildContext, int) 를 받아야함을 알 수 있음.
        itemBuilder: (context, index) {
          // 별도 메소드로 분리
          return _buildListItem(context, index);
        });
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network(
        'https://images.mypetlife.co.kr/wp-content/uploads/2018/06/06200333/pexels-photo-1108099-1024x768.jpeg',
        fit: BoxFit.cover);
  }
}
