import 'package:amazon_locker/models/product/product_model.dart';
import 'package:amazon_locker/widgets/base_widgets/appbar.dart';
import 'package:amazon_locker/widgets/base_widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingleProductScreen extends ConsumerStatefulWidget {
  final ProductModel product;

  const SingleProductScreen({Key? key, required this.product})
      : super(key: key);

  @override
  ConsumerState createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends ConsumerState<SingleProductScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: Text("Product Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
          ),
          const SizedBox(height: 100.0),
          Text(
            widget.product.title,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 30.0),
          Text(
            'Description',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
          ),
          Text(
            widget.product.description,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
                color: Color(0xFFAEB1C1)),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_quantity > 1) {
                          setState(() {
                            _quantity--;
                          });
                        }
                      },
                      child: Container(
                        height: 32.0,
                        width: 32.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: _quantity > 1
                                ? Colors.black
                                : Color(0xFFEFEFF3)),
                        child: Text(
                          '-',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: _quantity > 1
                                  ? Colors.white
                                  : Color(0xFF6F7490)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(_quantity.toString()),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _quantity++;
                        });
                      },
                      child: Container(
                        height: 32.0,
                        width: 32.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.black),
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: EdgeInsets.zero
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Expanded(child: Text('${(_quantity * widget.product.price).toInt()} L.E', textAlign: TextAlign.center,)),
                        Container(
                          height: 55.0,
                          width: 55.0,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Icon(Icons.shopping_bag_outlined),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
