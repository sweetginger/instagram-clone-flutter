import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/account_page.dart';
import 'package:instagram_clone/search_page.dart';

import 'home_page.dart';

/**
 * 하단 네비게이션에서 선택한 탭에 따라 탭별 페이지 구현
 */
class TabPage extends StatefulWidget {
  // 유저정보
  final FirebaseUser user;
  TabPage(this.user);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  // 선택된 탭 인덱스
  int _selectedIndex = 0;

  // 탭 별 페이지들을 각 클래스로 분리함
  List _pages;

  // 해당 클래스가 생성되는 시점. (Flutter Lifecycle)
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 클래스 내 변수에 접근할때는 widget.변수
    _pages = [
      HomePage(widget.user),
      SearchPage(widget.user),
      AccountPage(widget.user)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* body는 center 정렬하고 _pages의 선택된 탭 인덱스를 표시한다. */
      body: Center(child: _pages[_selectedIndex]),
      /* 하단 네비게이션 사용방법은 api docs를 따른다. key:value 방식 */
      bottomNavigationBar: BottomNavigationBar(
          // fixedColor: 선택된 탭의 컬러
          fixedColor: Colors.black,
          // 탭했을때 실행할 것 (여기서는 메소드를 부름)
          onTap: _onItemTapped,
          // 현재 탭 인덱스
          currentIndex: _selectedIndex,
          // 탭 아이템 배열
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('Search')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text('Account'))
          ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
