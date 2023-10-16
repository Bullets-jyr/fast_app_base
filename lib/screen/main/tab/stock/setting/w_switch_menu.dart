import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_os_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchMenu extends StatelessWidget {
  final String title;
  final bool isOn;
  // final void Function(bool isOn) onTap;
  final ValueChanged<bool> onChanged;

  const SwitchMenu(this.title, this.isOn, {super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        title.text.make(),
        emptyExpanded,
        // CupertinoSwitch(value: isOn, onChanged: onTap),
        // Switch(value: isOn, onChanged: onTap),
        OsSwitch(value: isOn, onChanged: onChanged),
      ],
    ).p20();
  }
}
