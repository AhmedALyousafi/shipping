import 'package:flutter/material.dart';

class ResponsiveUtils {
  static double getFontSize(BuildContext context, double size) {
    return size * MediaQuery.of(context).textScaleFactor;
  }

  static EdgeInsets getPagePadding(BuildContext context) {
    return EdgeInsets.all(MediaQuery.of(context).size.width > 991 ? 16.0 : 8.0);
  }

  static double getHeaderHeight(BuildContext context) {
    return 50.0;
  }

  static BorderRadius getBorderRadius(BuildContext context) {
    return BorderRadius.circular(8.0);
  }

  static double getCardElevation(BuildContext context) {
    return 4.0;
  }

  static double getTableRowHeight(BuildContext context) {
    return 40.0;
  }

  static EdgeInsets getTablePadding(BuildContext context) {
    return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
  }

  static double getAvatarSize(BuildContext context) {
    return 22.0;
  }
}

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout(
      {super.key,
      required this.mobileLayout,
      required this.tabletLayout,
      required this.desktopLayout});

  final Widget mobileLayout, tabletLayout, desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth < 750) {
          return mobileLayout;
        } else if (constraints.maxWidth < 1100) {
          return tabletLayout;
        } else {
          return desktopLayout;
        }
      }),
    );
  }
}
