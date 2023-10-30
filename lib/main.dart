import 'package:flutter/material.dart';
import 'package:olearis_test/style/theme.dart';
import 'package:olearis_test/view/home/home_screen.dart';
import 'package:olearis_test/view/sigin/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const SignInScreen(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const HomeScreen(),
      },
    );
  }
}
