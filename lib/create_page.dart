import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/**
 * Search 페이지에서 작성버튼 눌렀을때 연결되는 Create 페이지
 * 이미지를 선택하여 등록한다.
 */
class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  // 입력된 텍스트를 가져오는 TextEditingController()를 변수에 담는다.
  final textEditingController = TextEditingController();

  // 등록할때 선택한 이미지
  File _image;

  // 입력받은 값을 메모리에서 해제하기 위해 dispose() method를 선언하고, 그 안에서 메모리 해제할 변수를 지정한다.
  // CreatePage클래스가 실행될때 그 안의 변수가 생성되고, CreatePage클래스가 소멸될때 dispose() 가 실행된다.
  @override
  void dispose() {
    // TODO: implement dispose
    // 입력받은 텍스트를 메모리에서 해제한다.
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar, body를 별도 메소드로 분리함
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
          onPressed: _getImage, child: Icon(Icons.add_a_photo)),
    );
  }

  // Widget을 리턴하는 메소드
  Widget _buildAppBar() {
    return AppBar(
      // 앱바에서 무언가 액션을 취하는 버튼은 actions로 넣어준다.
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.send),
          onPressed: null,
        )
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        _image == null ? Text('No Image') : Image.file(_image),
        // TextFiled : text input이다. 이 값은 controller 로 지정된 textEditingController 변수에 담긴다.
        TextField(
            // decoration은 placeholder 역할을 한다.
            decoration: InputDecoration(hintText: '내용을 입력하세요.'),
            controller: textEditingController)
      ],
    ));
  }

  // 이미지를 갤러리에서 불러올 메소드
  // 이 메소드 안의 ImagePicker.pickImage() 는 리턴타입이 Futere<File> 이다.
  // 이 타입은 미래에 파일형식으로 리턴이 된다는 뜻이다. Future 타입은 async await 로 받아야 한다.
  void _getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
}
