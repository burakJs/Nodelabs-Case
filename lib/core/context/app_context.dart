import 'package:flutter/material.dart';

final class AppContext extends ChangeNotifier {
  ThemeMode _theme = ThemeMode.dark;
  ThemeMode get theme => _theme;

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  GlobalKey<ScaffoldMessengerState> get scaffoldKey => _scaffoldKey;

  void changeTheme() {
    _theme = _theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
