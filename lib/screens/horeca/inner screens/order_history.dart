import 'package:flutter/material.dart';
import 'package:horeca/components/widgets.dart';
import 'package:horeca/components/appbar.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: innerTitleAppBar('Order History'),
      // AppBar(
      //   title: myHeading("Order History", true, primaryColor),
      //   centerTitle: true,
      //   elevation: 1,
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              getOrderCard(context),
              sizeBox(15),
              getOrderCard(context),
              sizeBox(15),
              getOrderCard(context),
              sizeBox(15),
              getOrderCard(context),
              sizeBox(15),
              getOrderCard(context),
              sizeBox(15),
              getOrderCard(context),
              sizeBox(15),
              getOrderCard(context),
              sizeBox(15),
              getOrderCard(context),
              sizeBox(15),
              getOrderCard(context),
              sizeBox(15),
            ],
          ),
        ),
      ),
    ));
  }
}
