import 'package:flutter/material.dart';

class BaseAppBar extends AppBar {
  BaseAppBar(
      {Key? key,
      Widget? title,
      bool isDrawer = true,
      bool centerTitle = true,
      Widget? leading,
      bool isTransparent = true,
      double? elevation,
      Color? color,
      List<Widget>? actions})
      : super(
            key: key,
            title: title,
            automaticallyImplyLeading: isDrawer,
            leading: leading,
            centerTitle: centerTitle,
            backgroundColor: isTransparent ? Colors.transparent : color,
            elevation: isTransparent ? 0.0 : elevation,
            actions: actions);
}
