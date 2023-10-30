import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {
  final double width;
  final double height;

  const LogoWidget({
    Key? key,
    this.width = 375,
    this.height = 70,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset('assets/icons/logo.svg'),
    );
  }
}
