import 'package:flutter/material.dart';

class NavBarModel {
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  NavBarModel({required this.page, required this.navKey});
}
