import 'package:flutter/material.dart';

class AppConfigInheritedWidget extends InheritedWidget {
  final String title;

  const AppConfigInheritedWidget({Key? key, required this.title, required Widget child}) : super(key: key, child: child);

  static AppConfigInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfigInheritedWidget>();
  }

  @override
  bool updateShouldNotify(AppConfigInheritedWidget oldWidget) {
    return oldWidget.title != title;
  }
}
