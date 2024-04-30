import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: primaryColor,
        ),
        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10),
          child: Image.asset('assets/images/default_img.png'),
        )

      ],),
    ));
  }
}