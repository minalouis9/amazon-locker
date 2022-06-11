import 'package:amazon_locker/helpers/maps_bottom_sheet_helper.dart';
import 'package:amazon_locker/models/response/response_model.dart';
import 'package:amazon_locker/navigation/route_paths.dart';
import 'package:amazon_locker/providers/account_provider.dart';
import 'package:amazon_locker/providers/api_provider.dart';
import 'package:amazon_locker/providers/app_theme_provider.dart';
import 'package:amazon_locker/providers/location_provider.dart';
import 'package:amazon_locker/widgets/base_widgets/appbar.dart';
import 'package:amazon_locker/widgets/base_widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_launcher/map_launcher.dart';

class LocationScreen extends ConsumerStatefulWidget {
  final int productId;

  const LocationScreen({Key? key, required this.productId}) : super(key: key);

  @override
  ConsumerState createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> {
  int _selectedLocation = -1;
  bool _loading = false;

  @override
  initState() {
    super.initState();
    final locationController = ref.read(locationsProvider.notifier);
    if (locationController.locations.isEmpty) {
      locationController.getAllLocations();
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationState = ref.watch(locationsProvider);

    return Stack(
      children: [
        BaseScaffold(
          appBar: BaseAppBar(
            title: Text('Locker Locations'),
          ),
          body: Column(
            children: [
              Expanded(
                child: locationState.when(
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (error) => Center(child: Text(error)),
                  data: (data) {
                    return ListView.separated(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) =>
                          TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: data.elementAt(index).active == 1
                                ? Colors.black
                                : Colors.grey.withOpacity(0.2),
                            padding: EdgeInsetsDirectional.only(
                                start: 20.0, end: 10.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        onPressed: data.elementAt(index).active == 1
                            ? () => setState(() {
                                  if (_selectedLocation ==
                                      data.elementAt(index).id) {
                                    _selectedLocation = -1;
                                  } else {
                                    _selectedLocation =
                                        data.elementAt(index).id;
                                  }
                                })
                            : null,
                        child: Row(
                          children: [
                            if (_selectedLocation == data.elementAt(index).id)
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 10.0,
                                    backgroundColor: Colors.blue,
                                    child: Icon(
                                      Icons.done,
                                      color: Colors.white,
                                      size: 15.0,
                                    ),
                                  ),
                                  const SizedBox(width: 10.0)
                                ],
                              ),
                            Expanded(child: Text(data.elementAt(index).name)),
                            GestureDetector(
                                onTap: () {
                                  MapsSheet.show(
                                      context: context,
                                      onMapTap: (map) {
                                        map.showMarker(
                                            coords: Coords(
                                              data.elementAt(index).lat,
                                              data.elementAt(index).lng,
                                            ),
                                            title: data.elementAt(index).name);
                                      });
                                },
                                child: Icon(Icons.pin_drop_outlined))
                          ],
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 15.0),
                    );
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, padding: EdgeInsets.zero),
                onPressed: _selectedLocation != -1
                    ? () async {
                        setState(() {
                          _loading = true;
                        });
                        final ResponseModel response = await ref
                            .read(apiProvider)
                            .buyProduct(
                                user: ref.read(accountProvider).currentUser!,
                                productId: widget.productId,
                                locationId: _selectedLocation);
                        setState(() {
                          _loading = false;
                        });
                        if (response.statusCode == 201) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('You order has been placed successfully.'),
                          ));
                          Navigator.pop(context);
                          Navigator.pop(context);
                          // Navigator.pushNamed(
                          //     context, RoutePaths.singleOrderScreen,arguments: response.data['']);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(response.error!),
                          ));
                        }
                      }
                    : null,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Check out',
                      textAlign: TextAlign.center,
                    )),
                    Container(
                      height: 55.0,
                      width: 55.0,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Icon(Icons.exit_to_app),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        if (_loading)
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
      ],
    );
  }
}
