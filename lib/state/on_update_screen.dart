import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/model/default_appbar_layout.dart';
import 'package:getx_practice/state/getx_controller.dart';

class OnUpdateScreen extends StatefulWidget {
  const OnUpdateScreen({Key? key}) : super(key: key);

  @override
  _OnUpdateScreenState createState() => _OnUpdateScreenState();
}

class _OnUpdateScreenState extends State<OnUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    // controller 변수에 Get.put 하면 initiallize 해서 사용할 수 있음
    final controller = Get.put(BuilderController());

    return DefaultAppbarLayout(
      title: 'On Update',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'On Update',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            GetBuilder<BuilderController>(
              builder: (_) {
                return Text(
                  'count : ${_.count}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                controller.increment();
              },
              child: Text(
                'Count 업!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
