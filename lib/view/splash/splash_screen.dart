import 'package:flutter/material.dart';
import 'package:olearis_test/view/components/logo_widget.dart';
import 'package:olearis_test/view/sigin/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _opacity = 1;
      });
    });

    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const SignInScreen(),
          transitionDuration: const Duration(milliseconds: 100),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 1500),
          child: const LogoWidget(),
        ),
      ),
    );
  }
}
