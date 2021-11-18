import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/model/default_appbar_layout.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  int radioVal = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultAppbarLayout(
      title: 'Screen Three',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                RadioListTile(
                  title: Text('0'),
                  groupValue: radioVal,
                  value: 0,
                  onChanged: (int? value) {
                    setState(() {
                      radioVal = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('1'),
                  groupValue: radioVal,
                  value: 1,
                  onChanged: (int? value) {
                    setState(() {
                      radioVal = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('2'),
                  groupValue: radioVal,
                  value: 2,
                  onChanged: (int? value) {
                    setState(() {
                      radioVal = value!;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // 원래 뒤로 가기 기능
                // if(Navigator.of(context).canPop()){
                // Navigator.of(context).pop();
                // }

                // 뒤로가기 기능
                Get.back(result: radioVal);
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
