import 'package:amazon_flutter_clone/constants/constants.dart';
import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(alignment: Alignment.topLeft,child: Text('Deal of the day', style: TextStyle(fontSize: 20),),),
          space8,
          Center(child: Image.network('https://m.media-amazon.com/images/I/71vFKBpKakL._AC_UF1000,1000_QL80_.jpg', height: 240,)),
          space8,
          const Text('Apple Macbook Air M1', style: TextStyle(fontSize: 18),),
          const Text('\$1200', style: TextStyle(fontSize: 16),),
          space8,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network('https://m.media-amazon.com/images/I/71vFKBpKakL._AC_UF1000,1000_QL80_.jpg', height: 80, width: 80, fit: BoxFit.contain,),
                space4,
                Image.network('https://m.media-amazon.com/images/I/71vFKBpKakL._AC_UF1000,1000_QL80_.jpg', height: 80, width: 80, fit: BoxFit.contain,),
                space4,
                Image.network('https://m.media-amazon.com/images/I/71vFKBpKakL._AC_UF1000,1000_QL80_.jpg', height: 80, width: 80, fit: BoxFit.contain,),
                space4,
                Image.network('https://m.media-amazon.com/images/I/71vFKBpKakL._AC_UF1000,1000_QL80_.jpg', height: 80, width: 80, fit: BoxFit.contain,),
              ],
            ),
          ),
          space8,
          Text('View all deals', style: TextStyle(fontSize: 16, color: GlobalVariables.selectedNavBarColor),)
        ],
      ),
    );
  }
}