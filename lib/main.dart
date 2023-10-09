import 'package:easy_localization/easy_localization.dart';
import 'package:fast_app_base/common/data/preference/prefs.dart';
import 'package:fast_app_base/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'common/data/preference/app_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  // flutter_native_splash package안에서 기존의 네이티브화면을 보존하고 유지를 시켜줍니다.
  // 그러면 저희가 언젠가는 우리가 지워줘야합니다.
  final bindings = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: bindings);

  await EasyLocalization.ensureInitialized();
  await AppPreferences.init();
  await Prefs.appTheme.set(CustomTheme.dark);
  timeago.setLocaleMessages('ko', timeago.KoMessages());

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ko')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      useOnlyLangCode: true,
      child: const App(),
    ),
  );
}
