import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final List<String> _productImages = [
    'assets/images/placeholder.png',
    'assets/images/placeholder.png',
    'assets/images/placeholder.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1.0,
                  autoPlay: true,
                ),
                items: _productImages.map((imagePath) {
                  return Builder(
                    builder: (context) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover, // растягивает с обрезкой
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                          text: 'Amazing T-Shirt',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          children: [
                            TextSpan(
                                text: '\n € 12.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ))
                          ]),
                    ),
                    const Icon(Icons.favorite_border)
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "The perfect T-shirt for when you want to feel comfortable but still stylish. Amazing for all ocasions. Made of 100% cotton fabric in four colours. Its modern style gives a lighter look to the outfit. Perfect for the warmest days.",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Sizes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Row(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
