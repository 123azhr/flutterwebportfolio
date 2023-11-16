import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tab;
  final Widget desktop;
  const Responsive(
      {super.key, required this.mobile, this.tab, required this.desktop});

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 500;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 500 &&
      MediaQuery.sizeOf(context).width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1100;

  static Size getSize(BuildContext context) => MediaQuery.sizeOf(context);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    if (size.width >= 1100) {
      return desktop;
    }
    if (size.width >= 500 && tab != null) {
      return desktop;
    } else {
      return mobile;
    }
  }
}
