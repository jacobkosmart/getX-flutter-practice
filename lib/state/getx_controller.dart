import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Getx controller class 생성
class BuilderController extends GetxController {
  int count = 0;

  // increse method 생성
  increment() {
    count++;
    // state 가 변경될때 update() 호출해서 변경된것 알림
    update();
  }
}

// User model 생성
class User {
  int id;
  String name;

  User({
    required int id,
    required String name,
  })  : this.id = id,
        this.name = name;
}

class ReactiveController extends GetxController {
  // reactive 하게 만들기
  RxInt count1 = 0.obs;
  var count2 = 0.obs;

  // model 로 부터 observable instance 생성
  var user = User(id: 1, name: 'Jaocb').obs;

  List testList = [1, 2, 3, 4, 5].obs;

  // observable 하는 값을 getter를 생성해서 obs 가 업데이트 될때 마다 getter 도 같이 업데이트가 됨
  get sum => count1.value + count2.value;

  // observable instance 값 변경 하기
  change({
    required int id,
    required String name,
  }) {
    // .update 을 해줘야 observable instance 를 변경 해줄 수 있음
    user.update((val) {
      val!.id = id;
      val.name = name;
    });
  }

  @override
  void onInit() {
    super.onInit();

    // 4가지 worker : Ever, Once, Debounce, Interval
    //  Ever : value 값이 변경 될때 마다 실행
    ever(count1, (_) {
      print('EVER: Count1 이 변경 될때마다 실행');
    });
    // Once : value 값이 한번 실행 할때 만 실행되는 worker
    once(count1, (_) {
      print('ONCE: 처음으로 count1 이 변경 되었을때');
    });
    // Debounce: value 값이 변경 되고 지정된 time Duration 값이 지나고 나서 실행되는 worker (만약 Duration 시간 내에 value 변경이 일어나면 debounce 는 실행되지 않다가 Duration 시간이 지났는데 변경이 일어나지 않으면 그때 한번만 worker 실행함)
    debounce(
      count1,
      (_) {
        print("DEBOUNCE: 1초간 디바운스 한 뒤에 실행");
      },
      time: Duration(seconds: 1),
    );
    // Interval: value 값이 변경되는 runtime 시간 동안 inteval로 Duration 일정 시간 간격으로 실행되는 worker (반복되는 작업동안에 주기적으로 실행됨)
    interval(
      count1,
      (_) {
        print("INTERVAL: 1초간 인터벌이 지나면 실행");
      },
      time: Duration(seconds: 1),
    );
  }
}
