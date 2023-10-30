import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool isShowBorder;

  const LogoWidget({
    Key? key,
    this.width = 375,
    this.height = 70,
    this.isShowBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: isShowBorder
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
            )
          : null,
      width: width,
      height: height,
      child: SvgPicture.asset('assets/icons/logo.svg'),
    );
  }
}
