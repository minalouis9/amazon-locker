import 'package:amazon_locker/helpers/maps_bottom_sheet_helper.dart';
import 'package:amazon_locker/models/orders/order_model.dart';
import 'package:amazon_locker/widgets/base_widgets/appbar.dart';
import 'package:amazon_locker/widgets/base_widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_launcher/map_launcher.dart';

class SingleOrderScreen extends ConsumerStatefulWidget {
  final OrderModel order;

  const SingleOrderScreen({Key? key, required this.order}) : super(key: key);

  @override
  ConsumerState createState() => _SingleOrderScreenState();
}

class _SingleOrderScreenState extends ConsumerState<SingleOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: Text(
          widget.order.product.title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage(widget.order.product.imageUrl),
                    fit: BoxFit.cover)),
          ),
          Divider(
            thickness: 1.0,
          ),
          // const SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Order Status',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ),
              Text(widget.order.status),
            ],
          ),
          const SizedBox(height: 25.0),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.order.location.name,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ),
              CircleAvatar(
                child: IconButton(
                  splashRadius: 30.0,
                  onPressed: () {
                    MapsSheet.show(
                        context: context,
                        onMapTap: (map) {
                          map.showMarker(
                              coords: Coords(widget.order.location.lat,
                                    widget.order.location.lng,
                              ),
                              title: widget.order.location.name);
                        });
                  },
                  icon: Icon(Icons.pin_drop_outlined),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(widget.order.location.name),
                  // const SizedBox(height: 5.0),
                  if(widget.order.boxNumber != null)
                    Column(
                      children: [
                        Text('Locker No.', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),),
                        const SizedBox(height: 10.0),
                        CircleAvatar(
                          radius: 35.0,
                          child: Text(widget.order.boxNumber.toString(), style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  Text('Enter this OTP', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),),
                  const SizedBox(height: 5.0),
                  Text(widget.order.otp, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
          // Text(widget.order.location.name),
          // const SizedBox(height: 5.0),
          // if(widget.order.boxNumber != null)
          //   Column(
          //     children: [
          //       Text('Locker No.: ${widget.order.boxNumber}'),
          //       const SizedBox(height: 5.0),
          //     ],
          //   ),
          // Text('OTP: ${widget.order.otp}'),


        ],
      ),
    );
  }
}
