import 'package:amazon_locker/widgets/base_widgets/appbar.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String? screenTitle;
  final Widget? title;
  final bool enableAppBar;
  final bool disableDefaultPadding;
  final bool disableSafeArea;
  final bool enableDrawer;
  final List<Widget> drawerItems;

  BaseScaffold(
      {Key? key,
      required this.body,
      this.title,
      this.screenTitle,
        this.enableAppBar = true,
      this.disableDefaultPadding = false,
      this.disableSafeArea = false,
      this.enableDrawer = false,
      this.drawerItems = const []})
      : super(key: key) {
    if (screenTitle != null) {
      assert(title == null);
    }
    if (title != null) {
      assert(screenTitle == null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: enableAppBar ? BaseAppBar(
        title: screenTitle != null ? Text(screenTitle!) : title,
      ) : null,
      body: disableSafeArea
          ? disableDefaultPadding
              ? body
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: body,
                )
          : SafeArea(
              child: disableDefaultPadding
                  ? body
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: body,
                    ),
            ),
      drawer: enableDrawer
          ? Drawer(
              child: Column(
                children: [
                  const DrawerHeader(
                    child: CircleAvatar(),
                  ),
                  ...drawerItems
                ],
              ),
            )
          : null,
    );
  }
}
