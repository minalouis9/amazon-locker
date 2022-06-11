import 'package:amazon_locker/models/product/product_model.dart';
import 'package:amazon_locker/navigation/route_paths.dart';
import 'package:amazon_locker/providers/account_provider.dart';
import 'package:amazon_locker/providers/app_theme_provider.dart';
import 'package:amazon_locker/providers/products_provider.dart';
import 'package:amazon_locker/widgets/base_widgets/appbar.dart';
import 'package:amazon_locker/widgets/base_widgets/scaffold.dart';
import 'package:amazon_locker/widgets/logo.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  initState(){
    super.initState();
    final productsController = ref.read(productsProvider.notifier);
    if(productsController.models.isEmpty){
      productsController.getAllProducts();
    }

  }

  @override
  Widget build(BuildContext context) {
    final accountController = ref.watch(accountProvider);
    final productsState = ref.watch(productsProvider);

    return BaseScaffold(
      scaffoldKey: _scaffoldKey,
      enableDrawer: true,
      appBar: BaseAppBar(
        centerTitle: false,
        isDrawer: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello ${accountController.currentUser!.name}',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 3.0),
                  Text(
                    'Welcome back!',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFAEB1C1),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CarouselSlider.builder(
          //   itemCount: 5,
          //   options: CarouselOptions(
          //       aspectRatio: 326.0 / 182.0,
          //       viewportFraction: 0.85,
          //       autoPlay: true,
          //       enlargeCenterPage: true),
          //   itemBuilder: (BuildContext context, int index, int realIndex) =>
          //       Container(
          //     decoration: BoxDecoration(
          //         color: Colors.grey,
          //         borderRadius: BorderRadius.circular(15.0)),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 30.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 15.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'Popular Categories',
          //               style: TextStyle(
          //                   fontSize: 20.0, fontWeight: FontWeight.w500),
          //             ),
          //             Text(
          //               'See all',
          //               style: TextStyle(
          //                   fontSize: 16.0,
          //                   fontWeight: FontWeight.w400,
          //                   color: Color(0xFFAEB1C1)),
          //             ),
          //           ],
          //         ),
          //       ),
          //       const SizedBox(height: 20.0),
          //       SizedBox(
          //         height: 140.0,
          //         child: ListView.separated(
          //           itemCount: 5,
          //           scrollDirection: Axis.horizontal,
          //           itemBuilder: (BuildContext context, int index) =>
          //               Container(
          //             margin: index == 0
          //                 ? EdgeInsetsDirectional.only(start: 15.0)
          //                 : index == 4
          //                     ? EdgeInsetsDirectional.only(end: 15.0)
          //                     : null,
          //             height: 140.0,
          //             width: 280.0,
          //             decoration: BoxDecoration(
          //                 color: Colors.grey,
          //                 borderRadius: BorderRadius.circular(15.0)),
          //           ),
          //           separatorBuilder: (BuildContext context, int index) =>
          //               const SizedBox(width: 16.0),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          Text(
            'All Products',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: productsState.when(
                loading: () => Center(child: CircularProgressIndicator()),
                error: (error) => Center(child: Text(error)),
                data: (data) => ListView.separated(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) =>
                          ProductCard(
                        product: data.elementAt(index),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 16.0),
                    )),
          )
        ],
      ),
      drawerItems: SafeArea(
        child: Column(
          children: [
            Container(
              height: 150.0,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Logo(),
                    // Hero(
                    //   tag: 'logo',
                    //   child: Text(
                    //     'Amazon\nLocker'.toUpperCase(),
                    //     style: const TextStyle(
                    //         fontSize: 28.0, fontWeight: FontWeight.bold),
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
                    // const SizedBox(width: 5.0),
                    // Icon(Icons.lock_outline, size: 60.0,),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // TextButton(
                            //     key: UniqueKey(),
                            //     style: TextButton.styleFrom(
                            //       primary: Colors.white,
                            //       backgroundColor: Colors.blue,
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(10.0)
                            //       ),
                            //       fixedSize: Size(MediaQuery.of(context).size.width, 40.0)
                            //     ),
                            //     onPressed: () {
                            //       // Navigator.pop(context);
                            //       ref.read(appThemeProvider).changeAppTheme();
                            //     },
                            //     child: Row(
                            //       children: [
                            //         Icon(Icons.brightness_4_outlined),
                            //         const SizedBox(width: 10.0),
                            //         Expanded(child: Text('Change theme')),
                            //         Icon(Icons.arrow_forward_ios_outlined, size: 15.0,)
                            //       ],
                            //     )),
                            TextButton(
                                key: UniqueKey(),
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    fixedSize: Size(MediaQuery.of(context).size.width, 40.0)
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, RoutePaths.allLocationsScreen);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.pin_drop_outlined),
                                    const SizedBox(width: 10.0),
                                    Expanded(child: Text('All Locations')),
                                    Icon(Icons.arrow_forward_ios_outlined, size: 15.0,)
                                  ],
                                )),
                            TextButton(
                                key: UniqueKey(),
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    fixedSize: Size(MediaQuery.of(context).size.width, 40.0)
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, RoutePaths.myOrdersScreen);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.shopping_bag_outlined),
                                    const SizedBox(width: 10.0),
                                    Expanded(child: Text('My Orders')),
                                    Icon(Icons.arrow_forward_ios_outlined, size: 15.0,)
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                        key: UniqueKey(),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            fixedSize: Size(MediaQuery.of(context).size.width, 40.0)
                        ),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, RoutePaths.loginScreen, (route) => false);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.exit_to_app_outlined),
                            const SizedBox(width: 10.0),
                            Expanded(child: Text('Logout')),
                            Icon(Icons.arrow_forward_ios_outlined, size: 15.0,)
                          ],
                        ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RoutePaths.singleProductScreen,
          arguments: product),
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
                image: DecorationImage(image: NetworkImage(product.imageUrl), fit: BoxFit.cover)
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    product.price.toStringAsFixed(2),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            const SizedBox(width: 5.0),
            Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }
}
