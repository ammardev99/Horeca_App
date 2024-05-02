import 'package:flutter/material.dart';
import 'package:horeca/screens/horeca/cart.dart';

class ShowCart extends StatefulWidget {
  const ShowCart({super.key});

  @override
  State<ShowCart> createState() => _ShowCartState();
}

class _ShowCartState extends State<ShowCart> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: 
    Scaffold(
      body: Cart()));
  }
}