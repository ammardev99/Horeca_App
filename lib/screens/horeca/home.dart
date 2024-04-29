import 'package:flutter/material.dart';
import 'package:horeca/screens/components/assets.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            backgroundColor: primaryColor.withOpacity(0.6),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}