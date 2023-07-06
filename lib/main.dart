import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marshacc/page/main_page.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}
final ValueNotifier selectedIndexGlobal = ValueNotifier(0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context , child) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,

          debugShowCheckedModeBanner: false,
          initialRoute: "MainPage",
          routes: {
            'MainPage': (context) => const MainPage(),
          },
        );
      },
    );
  }
}

