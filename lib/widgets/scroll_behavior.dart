import 'package:flutter/material.dart';

class MyBehavior extends ScrollBehavior {
  /*@override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }*/
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    // Customize the ScrollPhysics here.
    return BouncingScrollPhysics(); // Example: Use BouncingScrollPhysics.
  }

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    // Customize the ViewportChrome here.
    return child;
  }

  @override
  ScrollController createScrollController() {
    // Create and customize your ScrollController here.
    return ScrollController();
  }
}