import 'package:flutter/material.dart';

class NavigationHandler {
  static void handleNavigation(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        Navigator.pushNamed(context, '/create');
        break;
      case 2:
        Navigator.pushNamed(context, '/scanner');
        break;
    }
  }
}
