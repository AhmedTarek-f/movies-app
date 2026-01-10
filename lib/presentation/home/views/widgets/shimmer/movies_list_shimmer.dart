import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/presentation/home/views/widgets/shimmer/movie_card_shimmer.dart';

class MoviesListShimmer extends StatelessWidget {
  const MoviesListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) => const MovieCardShimmer(),
      options: CarouselOptions(
        viewportFraction: 0.55,
        autoPlay: true,
        aspectRatio: 1.4 / 1,
        autoPlayInterval: const Duration(seconds: 6),
        enlargeCenterPage: true,
      ),
      itemCount: 15,
    );
  }
}
