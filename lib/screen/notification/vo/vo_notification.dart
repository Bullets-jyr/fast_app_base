import 'package:fast_app_base/screen/notification/vo/notification_type.dart';

class TtossNotification {
  final NotificationType type;
  final String description;
  final DateTime time;
  bool isRed;

  TtossNotification(
    this.type,
    this.description,
    this.time, {
    this.isRed = false,
  });
}
