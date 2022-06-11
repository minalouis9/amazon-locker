import 'package:amazon_locker/models/location/location_model.dart';
import 'package:amazon_locker/providers/location_provider.dart';
import 'package:amazon_locker/widgets/base_widgets/appbar.dart';
import 'package:amazon_locker/widgets/base_widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllLocationsScreen extends ConsumerStatefulWidget {
  const AllLocationsScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AllLocationsScreenState();
}

class _AllLocationsScreenState extends ConsumerState<AllLocationsScreen> {
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

    return BaseScaffold(
      disableDefaultPadding: true,
      appBar: BaseAppBar(
        title: Text('All Locations'),
      ),
      body: locationState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error) => Center(child: Text(error)),
          data: (data) => FlutterMap(
                options: MapOptions(
                  center: LatLng(0.0, 0.0),
                  zoom: 1.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                    attributionBuilder: (_) {
                      return Text("© OpenStreetMap contributors");
                    },
                  ),
                  MarkerLayerOptions(
                    markers: (data as List<LocationModel>)
                        .map((e) => Marker(
                              width: 40.0,
                              height: 40.0,
                              point: LatLng(e.lat, e.lng),
                              builder: (ctx) => Container(
                                // decoration: BoxDecoration(
                                //   color: Colors.blue,
                                //   shape: BoxShape.circle
                                // ),
                                child: Icon(Icons.pin_drop_outlined, color: Colors.black,),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              )),
    );
  }
}
