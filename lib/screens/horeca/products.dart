import 'package:flutter/material.dart';
import 'package:horeca/screens/components/assets.dart';
class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            backgroundColor: primaryColor,
      body: const Center(
        child: Text("Products"),
      ),
    );
  }
}