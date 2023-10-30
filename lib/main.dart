import 'package:flutter/material.dart';
import 'package:olearis_test/style/theme.dart';
import 'package:olearis_test/view/home/home_screen.dart';
import 'package:olearis_test/view/sigin/sign_in_screen.dart';
import 'package:olearis_test/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Olearis test',
      theme: lightTheme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const HomeScreen(),
        '/splash_screen': (BuildContext context) => const SignInScreen(),
      },
    );
  }
}
