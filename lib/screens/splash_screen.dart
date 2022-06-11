import 'package:amazon_locker/navigation/route_paths.dart';
import 'package:amazon_locker/widgets/base_widgets/scaffold.dart';
import 'package:amazon_locker/widgets/logo.dart';
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
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, RoutePaths.loginScreen));
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      disableDefaultPadding: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 150.0),
            Logo(
              width: 300.0,
              height: 300.0,
            ),
            const SizedBox(height: 15.0),
            const CircularProgressIndicator(),
            const SizedBox(height: 15.0),
            Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
              'assets/uni_logo.png',
              width: 100.0,
              height: 100.0,
            ),
                )),
          ],
        ),
      ),
    );
  }
}
