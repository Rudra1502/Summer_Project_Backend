import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:summer_project/main_page.dart';
import 'package:summer_project/screens/onboarding/onboarding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(),
      darkTheme: ThemeData(),
      home: const OnBoardingScreen(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Freelancing App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         brightness: Brightness.light,
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//       ),
//       home: OnBoardingScreen(),
//     );
//   }
// }
