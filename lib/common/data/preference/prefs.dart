import 'package:fast_app_base/common/data/preference/item/nullable_preference_item.dart';
import 'package:fast_app_base/common/theme/custom_theme.dart';
import 'package:get/get_rx/get_rx.dart';

import 'item/preference_item.dart';
import 'item/rx_preference_item.dart';
import 'item/rxn_preference_item.dart';

class Prefs {
  static final appTheme = PreferenceItem<CustomTheme>('appTheme', CustomTheme.light);
  static final isPushOn = PreferenceItem<bool>('isPushOn', false);
  // static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');
  // static final isPushOn = NullablePreferenceItem<bool>('isPushOn');

  static final isPushOnRx = RxPreferenceItem<bool, RxBool>('isPushOnRx', false);
  static final sliderPosition = RxPreferenceItem<double, RxDouble>('sliderPosition', 0.0);
  static final birthday = RxnPreferenceItem<DateTime, Rxn<DateTime>>('birthday');
  static final number = RxPreferenceItem<int, RxInt>('number', 0);
}
