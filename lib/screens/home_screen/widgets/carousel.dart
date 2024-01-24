import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: GlobalVariables.carouselImages
            .map((e) => Image.network(e, height: 200, fit: BoxFit.cover,))
            .toList(),
        options: CarouselOptions(
          height: 200,
          viewportFraction: 1
        ));
  }
}
