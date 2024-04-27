import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 100,
          child: SvgPicture.asset('images/logo.svg'),
        ),
        const Text("Home"),
        SizedBox(
          width: MediaQuery.of(context).size.width - 100,
          child: SvgPicture.asset('assets/images/bottom_curve.svg'),
        ),
      ],
    ));
  }
}
