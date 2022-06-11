import 'package:amazon_locker/models/orders/order_model.dart';
import 'package:amazon_locker/models/response/response_model.dart';
import 'package:amazon_locker/navigation/route_paths.dart';
import 'package:amazon_locker/providers/account_provider.dart';
import 'package:amazon_locker/providers/api_provider.dart';
import 'package:amazon_locker/widgets/base_widgets/appbar.dart';
import 'package:amazon_locker/widgets/base_widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyOrdersScreen extends ConsumerStatefulWidget {
  const MyOrdersScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends ConsumerState<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: Text('My Orders'),
      ),
      body: FutureBuilder(
        future: ref
            .read(apiProvider)
            .getAllOrders(user: ref.read(accountProvider).currentUser!),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final ResponseModel response = snapshot.data;
            if (response.statusCode == 200) {
              final List<OrderModel> orders = (response.data as List)
                  .map((e) => OrderModel.fromJson(e))
                  .toList();
              if (orders.isNotEmpty) {
                return ListView.separated(
                  itemCount: orders.length,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutePaths.singleOrderScreen,
                          arguments: orders.elementAt(index));
                    },
                    child: Container(
                      height: 95.0,
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2)),
                      child: Row(
                        children: [
                          Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: NetworkImage(orders
                                        .elementAt(index)
                                        .product
                                        .imageUrl),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(orders.elementAt(index).product.title),
                                const SizedBox(height: 10.0),
                                Text(
                                    'Order status: ${orders.elementAt(index).status}'),
                                const SizedBox(height: 10.0),
                                Text(
                                    'Total: ${orders.elementAt(index).product.price.toStringAsFixed(2)} L.E')
                              ],
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 15.0),
                );
              } else {
                return Center(
                    child: Text(
                  "You didn't make any orders yet!\nStart ordering now!",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ));
              }
            } else {
              return Center(
                child: Text(response.error.toString()),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
