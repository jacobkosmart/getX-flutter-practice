## GetX Practice

> [GetX official page](https://pub.dev/packages/get)

## GetX 개요

Provider 와 같이 가장 많이 사용되는 상태관리 툴로써 GetX 는 크게 2가지 기능으로 나뉠 수 있습니다

- Navigation

- State Management

## GetX 사용

- GetX package 를 설치하고, `MaterialApp` 을 `GetMaterialApp` 으로 바꿔줘야 GetX 에 있는 기능들을 다 사용할 수 있습니다.

## Navigation

### 1.페이지 이동하기

```dart
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
```

### 2.페이지 뒤로가기

```dart
ElevatedButton(
  onPressed: () {
    // 원래 뒤로 가기 기능 : pop 할때 뒤로갈 페이지가 있어야지 pop 을 하는데 안그려면 materialApp 을 완전히 나가버려서 black page 로 감
    // if(Navigator.of(context).canPop()){
    // Navigator.of(context).pop();
    // }

    // GetX 뒤로가기 : stack 을 하나 지우면서 pop 을 해야됨
    Get.back();
  },
  child: Text(
    '뒤로가기',
    style: TextStyle(fontSize: 20),
  ),
),
```

![Kapture 2021-11-16 at 19 56 03](https://user-images.githubusercontent.com/28912774/141973058-a99a0385-706d-4fb6-a9fc-b123e070487e.gif)

### 3.홈페이지로 바로가는 버튼

- `Get.off` 을 사용하면 home 으로 바로 갈 수 있는 버튼 을 만드는것

```dart
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
```

![Kapture 2021-11-16 at 20 05 58](https://user-images.githubusercontent.com/28912774/141974478-c8fc05f3-a4ef-4ddd-a816-78835d38310c.gif)

### 4.모든 페이지 스택 삭제하기

- splash , login screen 을 만들 때, 어떠한 페이지를 띄우고서 바왔던 모든 page 들을 navigation stack 에서 삭제 시키는 것임

```dart
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
```

![Kapture 2021-11-16 at 20 26 06](https://user-images.githubusercontent.com/28912774/141977164-690c10d5-3f6c-465f-ba58-38020c0ba841.gif)

### 5.리턴값 받아오기

ScreenThree 에서 선택된 값 받아오기

```dart

// in navigation.dart

int returnVal = 0;

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

```

```dart
// in screen_three.dart
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
                // Get.back 하면서 result: radioVal 값을 전달 하기
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
```

![Kapture 2021-11-16 at 21 18 32](https://user-images.githubusercontent.com/28912774/141984066-e32b9db7-9b2e-47f5-a274-b22fdf0077f2.gif)

### 6.argument 값 보내기

위의 return 값을 받아오는 거와 반대로 정해진 argument 값도 다른 페이지에 전달할 수 있습니다 (Screen Four 로 보내기)

```dart
// in navigation.dart

ElevatedButton(
  onPressed: () {
    Get.to(() => ScreenFour(), arguments: 'GetX 값 보내기 test');
  },
  child: Text(
    'argument 보내기',
    style: TextStyle(fontSize: 20),
  ),
),

```

```dart
// in Screen four

child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      Get.arguments,
      style: TextStyle(fontSize: 20),
    ),
    ElevatedButton(
      onPressed: () {
        Get.back();
      },
      child: Text(
        '뒤로가기',
        style: TextStyle(fontSize: 20),
      ),
    ),
  ],
),
```

![Kapture 2021-11-16 at 21 42 13](https://user-images.githubusercontent.com/28912774/141987176-928755f3-9431-42ca-bec3-f7239f3856f6.gif)

### 7.Transition

GetX 에서 제공하는 많은 page transition 을 적용하면 좀 더 다이나믹 하게 페이지 전환을 할 수 있습니다.

- GetX 에서 제공하는 transition 속성은 다음과 같습니다

```dart
enum Transition {
  fade,
  fadeIn,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  rightToLeftWithFade,
  leftToRightWithFade,
  zoom,
  topLevel,
  noTransition,
  cupertino,
  cupertinoDialog,
  size,
  native
}
```

```dart
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
```

![Kapture 2021-11-16 at 22 01 44](https://user-images.githubusercontent.com/28912774/141990130-0395a5b7-8115-44f7-b758-5c1b242e95ec.gif)

### 8.Named Route

- GetX 의 Navigation 에서 유용한 기능으로 Material App 에서 on generic route 를 사용해서 named route 를 사용 가능한데, GetX 에서는 `getPages` 를 사용해서 url 에 파라미터를 집어 넣는 기능을 간단히 만들 수 있습니다.

- Web 에서 routing 할때, parameter 와 query 를 사용해서 자주 사용하는데 on generic routing 을 사용하게 되면 구현이 복잡하지만 GetX 에서는 간단히 사용할 수 있습니다.

```dart
// in main.dart

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

```

```dart
// navigation.dart

ElevatedButton(
  onPressed: () {
    // five/:param?id=444&name=Jacob 페이지로 named route 함
    Get.toNamed('/five/1234?id=444&name=Jacob');
  },
  child: Text(
    "Named route",
    style: TextStyle(fontSize: 20),
  ),
),

```

```dart
// screen_five.dart

child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      Get.parameters['param']!,
      style: TextStyle(fontSize: 20),
    ),
    Text(
      Get.parameters['id']!,
      style: TextStyle(fontSize: 20),
    ),
    Text(
      Get.parameters['name']!,
      style: TextStyle(fontSize: 20),
    ),
  ],
),
```

![Kapture 2021-11-17 at 20 42 00](https://user-images.githubusercontent.com/28912774/142194377-53e3fc54-9b61-4aea-bf73-4793fce22da4.gif)

### 9.Snack bar 기능

- material App 의 snack bar 의 기능을 GetX 에서 snack bar의 기능을 지원합니다

```dart
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
```

![Kapture 2021-11-17 at 20 53 09](https://user-images.githubusercontent.com/28912774/142195871-13c93f40-3bea-4cee-9c1f-41f4646c769c.gif)

### 10.Dialog 기능

- GetX 를 사용하면 쉽게 다이얼 로그 (alert 창)을 쉽게 만들 수 있습니다. option 이 많기 때문에 customizing 을 쉽게 할 수 있습니다

```dart

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

```

![Kapture 2021-11-17 at 21 03 32](https://user-images.githubusercontent.com/28912774/142197262-7d663df8-f80a-4819-aaf0-55e05fdb66c0.gif)

### 11.Bottom Sheet

- 화면 하단에 listView 라던지 나타내고 싶은 Widget 을 넣으면 아래에서 부터 화면에 표시하기 됩니다

```dart
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
```

![Kapture 2021-11-17 at 21 21 58](https://user-images.githubusercontent.com/28912774/142199737-fb8ee9eb-4171-49d0-a394-1a8197ca1c0a.gif)

## State Management

### 1.on Update

- 왠만한 상황에서는 on update 기능을 사용하는데, 왜냐하면 메모리 사용양이 적게 됨

```dart
// in getx_controller.dart

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
```

```dart
// in on_update_screen.dart

class _OnUpdateScreenState extends State<OnUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    // controller 변수에 Get.put 하면 initialize 해서 사용할 수 있음
    final controller = Get.put(BuilderController());

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
```

![Kapture 2021-11-18 at 14 26 20](https://user-images.githubusercontent.com/28912774/142357141-3c475afe-0e6b-468b-a690-0bf9617862f0.gif)

### 2.Reactive

```dart
// in getx_controller.dart

class ReactiveController extends GetxController {
  // reactive 하게 변수 생성만들기
  RxInt count1 = 0.obs;
  var count2 = 0.obs;

```

```dart
class _ReactiveScreenState extends State<ReactiveScreen> {
  final controller = Get.put(ReactiveController());

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
  ],
),
```

![Kapture 2021-11-18 at 14 43 35](https://user-images.githubusercontent.com/28912774/142358926-62b05543-846b-4292-a9e4-e9d91ae5a2d5.gif)

### Obx 을 사용

- Obx 를 사용하면 builder 를 생성하지 않고 Controller 에 선언된 변수에 접근해서 사용할 수 있음 (Observable 의 값을 불러올때 사용함)

```dart
// reactive.dart

Obx(() {
  return Text(
    'Count 2 : ${controller.count2.value}',
    style: TextStyle(
      fontSize: 20,
    ),
  );
}),
```

![Kapture 2021-11-18 at 14 49 57](https://user-images.githubusercontent.com/28912774/142359580-64e50ed1-0806-45ad-b9c9-aedd5530395e.gif)

- obx 도 변경이 되는 것만 빌드가 됨

```dart
// in getx_controller.dart

  // observable 하는 값을 getter를 생성해서 obs 가 업데이트 될때 마다 getter 도 같이 업데이트가 됨
  get sum => count1.value + count2.value;
```

```dart
// getter 임으로 sum 뒤에 value 붙이지 않음
Obx(() {
  print("Sum BUILD");
  return Text(
    'Sum : ${controller.sum}',
    style: TextStyle(
      fontSize: 20,
    ),
  );
},),
```

![Kapture 2021-11-18 at 14 57 51](https://user-images.githubusercontent.com/28912774/142360509-15fee512-badb-426d-9f5c-43240191f3bf.gif)

### class 의 instance 를 obx 로 만들기

```dart
// in getx_controller.dart

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

// model 로 부터 observable instance 생성
var user = User(id: 1, name: 'Jaocb').obs;

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

```

```dart
// in reactive.dart

 Obx(() {
  return Text(
    'User : ${controller.user.value.id} / ${controller.user.value.name}',
    style: TextStyle(
      fontSize: 20,
    ),
  );
}),

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
```

![Kapture 2021-11-18 at 15 11 44](https://user-images.githubusercontent.com/28912774/142361988-56614506-df2a-4295-b242-2789f3c5897c.gif)

- 단, list 나 map 같이 primitive 값이 아닌 경우에는 .value 를 사용하지 않고 사용합니다

```dart
// in getx_controller.dart

List testList = [1, 2, 3, 4, 5].obs;
```

```dart
// in reactive.dart

 Obx(() {
  return Text(
    'List : ${controller.testList}',
    style: TextStyle(
      fontSize: 20,
    ),
  );
}),
```

![image](https://user-images.githubusercontent.com/28912774/142362591-0a3d772c-a378-4e5a-bf78-b2a0aeb1fda1.png)

### Observable Worker 기능

- worker 를 사용하지 않는 상황이면 되도록 on update 를 사용해서 state management 하는 것이 좋은데, 만약 아래와 같은 상황일때는 observable worker 를 사용해야 합니다

- obs 을 사용할때는 주로 4가지 worker 를 사용할 때 쓰입니다

- 주로 Debounce 를 유용하게 사용할 수 있는데 server 로 부터 fetch data 를 가지고 오는 상황에서 만약, user 가 form 에서 이 입력한 데이터를 서버로 보내서 검색한 후, Get 하는 상황에서 user 가 입력할때 마다 그 정보를 서버로 post, get 하는것보다 `debounce` worker 를 사용하게 되면 user 가 입력이 끝나면 그때 server 로 post 학게 될때 자주 사용됩니다

```dart
// getx_controller.dart

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

```

![image](https://user-images.githubusercontent.com/28912774/142365291-1eafade5-90e8-4f54-8466-2215e124b288.png)

🔶 🔷 📌 🔑

## Reference

GetX pub.dev - [https://pub.dev/packages/get](https://pub.dev/packages/get)

Terry's Dev-Diary - [https://terry1213.github.io/flutter/flutter-getx/](https://terry1213.github.io/flutter/flutter-getx/)

코드 팩토리 - [https://youtu.be/wgJItCEL7hkhttps://youtu.be/wgJItCEL7hk](https://youtu.be/wgJItCEL7hk)
