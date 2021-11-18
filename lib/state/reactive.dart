import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/model/default_appbar_layout.dart';
import 'package:getx_practice/state/getx_controller.dart';

class ReactiveScreen extends StatefulWidget {
  const ReactiveScreen({Key? key}) : super(key: key);

  @override
  _ReactiveScreenState createState() => _ReactiveScreenState();
}

class _ReactiveScreenState extends State<ReactiveScreen> {
  final controller = Get.put(ReactiveController());

  @override
  Widget build(BuildContext context) {
    return DefaultAppbarLayout(
      title: 'Reactive',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reactive',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // Reactive 로 GetX 불러오기
            GetX<ReactiveController>(
              builder: (_) {
                return Text(
                  'Count 1: ${_.count1.value}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                );
              },
            ),
            Obx(() {
              return Text(
                'Count 2 : ${controller.count2.value}',
                style: TextStyle(
                  fontSize: 20,
                ),
              );
            }),
            // getter 임으로 sum 뒤에 value 붙이지 않음
            Obx(() {
              return Text(
                'Sum : ${controller.sum}',
                style: TextStyle(
                  fontSize: 20,
                ),
              );
            }),
            Obx(() {
              return Text(
                'User : ${controller.user.value.id} / ${controller.user.value.name}',
                style: TextStyle(
                  fontSize: 20,
                ),
              );
            }),
            Obx(() {
              return Text(
                'List : ${controller.testList}',
                style: TextStyle(
                  fontSize: 20,
                ),
              );
            }),
            ElevatedButton(
              onPressed: () {
                controller.count1++;
              },
              child: Text(
                'Count1 UP!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.count2++;
              },
              child: Text(
                'Count2 UP!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.change(id: 2, name: 'Emma');
              },
              child: Text(
                'Change User!',
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
