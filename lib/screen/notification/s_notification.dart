import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/d_notification.dart';
import 'package:fast_app_base/screen/notification/notifications_dummy.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    // Sliver(조각)List
    // Sliver(조각)들을 조합해서 하나의 리스트로 관리할 수 있습니다.
    // 구현하기 위해서는 CustomScrollView를 사용해야합니다.

    // Scaffold 또는 Material 적용
    return Scaffold(
      // backgroundColor: AppColors.veryDarkGrey,
      body: CustomScrollView(
        // 가장 위에 선언한 레이어가 실제로 가장 위에 위치합니다. (Stack과 반대입니다.)
        slivers: [
          const SliverAppBar(
            title: Text('알림'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => NotificationItemWidget(
                notification: notificationDummies[index],
                onTap: () {
                  NotificationDialog([notificationDummies[0], notificationDummies[1]]).show();
                },
              ),
              childCount: notificationDummies.length,
            ),
          ),
        ],
      ),
    );
  }
}
