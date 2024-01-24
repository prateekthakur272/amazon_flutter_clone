import 'package:amazon_flutter_clone/constants/constants.dart';
import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:amazon_flutter_clone/screens/account/widgets/order_view.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  final images = [
    'https://m.media-amazon.com/images/I/71vFKBpKakL._AC_UF1000,1000_QL80_.jpg',
    'https://m.media-amazon.com/images/I/619f09kK7tL._AC_UF1000,1000_QL80_.jpg',
    'https://www.aptronixindia.com/media/catalog/product/cache/31f0162e6f7d821d2237f39577122a8a/s/o/sony_wh-ch710n_black_1.png',
    'https://i.gadgets360cdn.com/products/large/sony-ps5-649x800-1592631239.jpeg?downsize=*:360'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Orders',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Text(
                'See all',
                style: TextStyle(
                    color: GlobalVariables.selectedNavBarColor, fontSize: 16),
              )
            ],
          ),
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            separatorBuilder: (context, index) => space8,
            itemBuilder: ((context, index) => OrderView(url: images[index]))),
        )
      ],
    );
  }
}
