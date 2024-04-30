import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';
class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            backgroundColor: primaryColor.withOpacity(0.6),
      body: const Center(
        child: Text("Cart"),
      ),
    );
  }
}