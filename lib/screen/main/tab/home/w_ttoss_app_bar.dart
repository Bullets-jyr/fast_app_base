import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:flutter/material.dart';

class TtossAppBar extends StatefulWidget {
  // 여러 코드에서 참조할 수 있는 상수를 만들때는 static const 키워드로 상수를 만듭니다.
  static const double appBarHeight = 60;
  const TtossAppBar({super.key});

  @override
  State<TtossAppBar> createState() => _TtossAppBarState();
}

class _TtossAppBarState extends State<TtossAppBar> {
  bool _showRedDot = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: TtossAppBar.appBarHeight,
      // app theme 접근
      color: context.appColors.appBarBackground,
      child: Row(
        children: [
          width10,
          Image.asset(
            '$basePath/icon/toss.png',
            height: 30,
          ),
          // Expanded(child: Container()),
          // EmptyExpanded(),
          emptyExpanded,
          Image.asset(
            '$basePath/icon/map_point.png',
            height: 30,
          ),
          width10,
          Tap(
            onTap: () {
              // setState(() {
              //   _showRedDot = !_showRedDot;
              // });
              // 알림 화면으로 이동
              Nav.push(NotificationScreen());
            },
            child: Stack(
              children: [
                Image.asset(
                  '$basePath/icon/notification.png',
                  height: 30,
                ),
                if (_showRedDot)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
                // else Positioned.fill(
                //   child: Align(
                //     alignment: Alignment.topRight,
                //     child: Container(
                //       width: 6,
                //       height: 6,
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: Colors.blue,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          width10,
        ],
      ),
    );
  }
}
