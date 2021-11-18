import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/model/default_appbar_layout.dart';
import 'package:getx_practice/navigation/screen_four.dart';
import 'package:getx_practice/navigation/screen_three.dart';
import 'package:getx_practice/navigation/screen_two.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int returnVal = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultAppbarLayout(
      title: 'Navigation',
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // 원래 material page 를 사용해야 함
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (_) => ScreenTwo(),
                  //   )
                  // );

                  // GetX를 사용해서 페이지 이동
                  Get.to(() => ScreenTwo());
                },
                child: Text(
                  "Screen 2 이동",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // 원래는 pushReplacement 사용해서 ScreenTwo() 로 넘어가면 뒤로가기 안되게 함
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //     builder: (_) => ScreenTwo(),
                  //   ),
                  // );

                  // Get.off 를 사용하면 쌓여 있는 stack 이 지워지면서 home 화면으로 감
                  Get.off(() => ScreenTwo());
                },
                child: Text(
                  "전 페이지로 돌아가지 못하게하기",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // 모든 페이지를 삭제하고, 새로운 page 를 push 해주는것 pushAndRemoveUntil 을 사용하게 됨
                  // Navigator.of(context).pushAndRemoveUntil(
                  //   MaterialPageRoute(
                  //     builder: (_) => ScreenTwo(),
                  //   ),
                  //   (route) => false,
                  // );

                  // Get.offAll 을 사용해서 뒤로가기 버튼을 눌러도 stack 이 다 지워지기 때문에 뒤로 갈수가 없게 됨
                  Get.offAll(() => ScreenTwo());
                },
                child: Text(
                  "모든 페이지 스택 삭제하기",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              Text(
                '리턴값 : $returnVal',
              ),
              ElevatedButton(
                onPressed: () async {
                  // 받아온 값을 비동기로 resp 에 변수 선언함
                  final resp = await Get.to(() => ScreenThree());
                  // state 변경
                  setState(() {
                    returnVal = resp;
                  });
                },
                child: Text(
                  '리턴값 받아오기',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => ScreenFour(), arguments: 'GetX 값 보내기 test');
                },
                child: Text(
                  'argument 보내기',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  // GetX를 사용해서 페이지 이동
                  Get.to(() => ScreenTwo(),
                      transition: Transition.rightToLeftWithFade);
                },
                child: Text(
                  "Transition",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/five/1234?id=444&name=Jacob');
                },
                child: Text(
                  "Named route",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    '제목을 써주세요',
                    '내용을 여기에 적으시면 됩니다',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: Text(
                  "SnackBar",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Dialog 제목',
                    middleText: 'Dialog 내용',
                  );
                },
                child: Text(
                  "Dialog",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      color: Colors.white,
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                              leading: Icon(Icons.music_note),
                              title: Text('Music'),
                              onTap: () => {}),
                          ListTile(
                            leading: Icon(Icons.videocam),
                            title: Text('Video'),
                            onTap: () => {},
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Text(
                  "Bottom Sheet",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
