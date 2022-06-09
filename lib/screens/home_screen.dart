import 'package:amazon_locker/models/product/product_model.dart';
import 'package:amazon_locker/navigation/route_paths.dart';
import 'package:amazon_locker/providers/app_theme_provider.dart';
import 'package:amazon_locker/widgets/base_widgets/appbar.dart';
import 'package:amazon_locker/widgets/base_widgets/scaffold.dart';
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
  Widget build(BuildContext context) {
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
                children: const [
                  Text(
                    'Hello Mina!',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Good Morning!',
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
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => ProductCard(
                product: ProductModel(
                    title: 'Lenovo Yoga 920 13/Core i7/16GB/SSD 1TB',
                    description: 'description',
                    imageUrl: 'imageUrl',
                    price: 959.00),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 16.0),
            ),
          )
        ],
      ),
      drawerItems: Column(
        children: [
          const SizedBox(height: 200.0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextButton(
                      key: UniqueKey(),
                      onPressed: () {
                        // Navigator.pop(context);
                        ref.read(appThemeProvider).changeAppTheme();
                      },
                      child: Text('Change theme')),
                  TextButton(
                      key: UniqueKey(),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, RoutePaths.loginScreen, (route) => false);
                      },
                      child: Text('Logout')),
                ],
              ),
            ),
          ),
        ],
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
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          children: [
            Container(
              height: 80.0,
              width: 80.0,
              color: Colors.grey,
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
