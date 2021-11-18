import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/navigation/navigation.dart';
import 'package:getx_practice/navigation/screen_five.dart';
import 'package:getx_practice/navigation/screen_four.dart';
import 'package:getx_practice/navigation/screen_three.dart';
import 'package:getx_practice/navigation/screen_two.dart';
import 'package:getx_practice/state/state_management.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      getPages: [
        GetPage(
          name: '/nav',
          page: () => Navigation(),
        ),
        GetPage(
          name: '/two',
          page: () => ScreenTwo(),
        ),
        GetPage(
          name: '/three',
          page: () => ScreenThree(),
        ),
        GetPage(
          name: '/four',
          page: () => ScreenFour(),
        ),
        // named route 를 위한 :param 을 사용함
        GetPage(
          name: '/five/:param',
          page: () => ScreenFive(),
        ),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter GetX'),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => Navigation());
              },
              child: Text(
                '네비게이션 이동',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => StateManagement());
              },
              child: Text(
                '상태관리 이동',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
