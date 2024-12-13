import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pet_hub/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SwiperSlider extends StatefulWidget {
  final List<String> imagePaths;

  const SwiperSlider({super.key, required this.imagePaths});

  @override
  State<SwiperSlider> createState() => _SwiperSliderState();
}

class _SwiperSliderState extends State<SwiperSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Swiper/Carousel Slider
        CarouselSlider(
          items: widget.imagePaths.map((path) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                path,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            // height: 200,
            aspectRatio: 2,
            viewportFraction: 1,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),

        // Smooth Page Indicator
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: widget.imagePaths.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: darkGreen,
            dotColor: sharpgreen,
            dotHeight: 8,
            dotWidth: 8,
            expansionFactor: 3,
          ),
        ),
      ],
    );
  }
}
