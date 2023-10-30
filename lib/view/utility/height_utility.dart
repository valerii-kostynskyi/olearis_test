import 'package:flutter/material.dart';

class HeightUtility {
  static double getStatusAndAppBarHeight(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double appBarHeight = AppBar().preferredSize.height;
    return statusBarHeight + appBarHeight;
  }
}
