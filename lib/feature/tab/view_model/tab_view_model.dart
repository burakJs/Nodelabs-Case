import 'package:flutter/material.dart';
import 'package:nodelabs_case/feature/tab/tab_view.dart';

mixin TabViewModel on State<TabView> {
  void onItemTapped(int index) {
    widget.navigationShell.goBranch(index);
  }
}
