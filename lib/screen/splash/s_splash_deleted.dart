import 'package:after_layout/after_layout.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/num_duration_extension.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {

  // 일반적으로 initState함수에서 화면 전환이나, 화면에 어떤 데이터를 바꿔주는 작업들을 하게 되면 Crash가 날 확률이 있습니다.
  // initState안에서는 값만 변경을 해야지 뭔가 화면에 실질적으로 영향을 주려고하면 에러가 발생하게 되어있습니다.
  // 그래서 화면의 초기화에서는 with AfterLayoutMixin을 이용하는게 좋습니다.
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    delay(() {
      Nav.clearAllAndPush(MainScreen());
    }, 1500.ms);
  }

  @override
  void initState() {
    // delay(() {
    //   Nav.clearAllAndPush(MainScreen());
    // }, 1500.ms);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/image/splash/splash.png',
        width: 192,
        height: 192,
      ),
    );
  }
}
