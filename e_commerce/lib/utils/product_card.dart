import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  const ProductCard({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          color: const Color.fromARGB(155, 255, 255, 255),
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12)),
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            // borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              'assets/images/placeholder.png',
              height: 120,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: RichText(
                text: TextSpan(
                    text: name,
                    style: const TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                      text: '\n $price',
                      style: const TextStyle(fontWeight: FontWeight.bold))
                ])),
          )
        ],
      ),
    );
  }
}
