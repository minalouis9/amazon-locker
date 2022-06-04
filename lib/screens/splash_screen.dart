import 'package:amazon_locker/widgets/base_widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      enableAppBar: false,
      disableSafeArea: true,
      disableDefaultPadding: true,
      body: Column(
        children: [],
      ),
    );
  }
}
