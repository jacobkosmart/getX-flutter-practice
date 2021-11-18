import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/model/default_appbar_layout.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultAppbarLayout(
      title: 'Screen Two',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Screen Two'),
            ElevatedButton(
              onPressed: () {
                // 원래 뒤로 가기 기능
                // if(Navigator.of(context).canPop()){
                // Navigator.of(context).pop();
                // }

                // 뒤로가기 기능
                Get.back();
              },
              child: Text(
                '뒤로가기',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
