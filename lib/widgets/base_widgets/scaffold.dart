import 'package:amazon_locker/widgets/base_widgets/appbar.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final bool disableDefaultPadding;
  final bool disableSafeArea;
  final bool enableDrawer;
  final PreferredSizeWidget? appBar;
  final Widget? drawerItems;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const BaseScaffold(
      {Key? key,
      required this.body,
      this.disableDefaultPadding = false,
      this.disableSafeArea = false,
      this.enableDrawer = false,
        this.appBar,
      this.drawerItems, this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
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
              child: drawerItems,
            )
          : null,
    );
  }
}
