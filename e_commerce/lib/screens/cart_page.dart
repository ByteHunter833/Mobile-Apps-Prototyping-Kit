import 'package:e_commerce/utils/card_product.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, String>> _products = [
    {'title': 'Amazing T-shirt', 'subtitle': 'Black / M', 'price': '€ 13.00'},
    {'title': 'Fabulous Pants', 'subtitle': 'Blue / 42', 'price': '€ 15.00'},
    {'title': 'Spectacular Dress', 'subtitle': 'Gold / L', 'price': '€ 20.00'},
    {'title': 'Stunning Jacket', 'subtitle': 'Blue / M', 'price': '€ 18.00'},
    {'title': 'Wonderful Shoes', 'subtitle': 'Green / 39', 'price': '€ 18.00'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.blue,
          ),
          title: const Text('Your bag'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return CardProduct(
                      price: product['price'] ?? '',
                      productSubtitle: product['subtitle'] ?? '',
                      productTitle: product['title'] ?? '');
                },
                itemCount: _products.length,
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text(
                        '€ 83.00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        minimumSize:
                            WidgetStatePropertyAll(Size.fromHeight(48)),
                        backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                    child: const Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
