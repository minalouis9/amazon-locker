import 'package:amazon_locker/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';

class MapsSheet {
  static show({
    required BuildContext context,
    required Function(AvailableMap map) onMapTap,
  }) async {
    final availableMaps = await MapLauncher.installedMaps;

    return await showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) => Consumer(
        builder: (BuildContext context, ref, Widget? child) {
          final themeController = ref.watch(appThemeProvider);

          return Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4),
            width: MediaQuery.of(context).size.width,
            // alignment: Alignment.center,
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 5.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      color: themeController.themeMode == ThemeMode.light
                          ? Colors.black
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                const SizedBox(height: 15.0),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Choose your preferred map',
                      ),
                      SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Wrap(
                            children: <Widget>[
                              for (var map in availableMaps)
                                Container(
                                  decoration: BoxDecoration(
                                    color: themeController.themeMode ==
                                            ThemeMode.light
                                        ? Colors.grey
                                        : Colors.black38,
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                  child: ListTile(
                                    // tileColor: kWhiteColor,
                                    // shape: RoundedRectangleBorder(
                                    //   borderRadius: BorderRadius.circular(40.0),
                                    // ),
                                    onTap: () => onMapTap(map),
                                    title: Text(map.mapName),
                                    leading: SvgPicture.asset(
                                      map.icon,
                                      height: 30.0,
                                      width: 30.0,
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 5.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
