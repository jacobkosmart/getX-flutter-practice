import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/model/default_appbar_layout.dart';
import 'package:getx_practice/state/on_update_screen.dart';
import 'package:getx_practice/state/reactive.dart';

class StateManagement extends StatelessWidget {
  const StateManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultAppbarLayout(
      title: 'GetX State Management',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => OnUpdateScreen());
              },
              child: Text(
                "On Update",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ReactiveScreen());
              },
              child: Text(
                "Reactive",
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
