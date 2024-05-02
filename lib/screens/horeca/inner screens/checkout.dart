import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horeca/components/appbar.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';
import 'package:horeca/models/product.dart';
import 'package:horeca/screens/horeca.dart';
import 'package:horeca/screens/horeca/inner%20screens/address_details.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

bool isOnDelivery = true;
bool isVisa = false;

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: innerTitleAppBar('Checkout'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        // Invoice
              getInvoice(),
              sizeBox(15),
              myHeading("Delivery Address", false),
              sizeBox(10),
              profileOption("Address Details", const AddressDetails()),
        
              sizeBox(15),
              myHeading("Payment Option", false),
              sizeBox(10),
        // Payment Option
              paymentOption(Icons.credit_card_rounded, 'VISA', isVisa),
              sizeBox(15),
              paymentOption(
                  Icons.payments_outlined, 'Cash on Delivery', isOnDelivery),
        // Payment Option
              sizeBox(40),
              placeOrder(context),
              sizeBox(50)
            ],
          ),
        ),
      ),
    ));
  }

  Widget paymentOption(IconData icon, String text, bool check) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: borderColor),
          borderRadius: BorderRadius.circular(8)),
      child: ListTile(
          selected: true,
          selectedColor: primaryColor,
          enabled: true,
          onTap: () {
            setState(() {
              text == 'VISA'
                  ? {
                      isVisa = true,
                      isOnDelivery = false,
                    }
                  : {
                      isVisa = false,
                      isOnDelivery = true,
                    };
            });
          },
          splashColor: primaryLightColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          leading: Icon(
            icon,
            color: primaryColor,
          ),
          title: myHeading(text, false),
          trailing: Icon(check == true
              ? Icons.check_circle_rounded
              : Icons.circle_outlined)),
    );
  }
}

Widget placeOrder(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: whiteColor,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/png/done.png",
                      height: 100,
                    ),
                    myHeading("Order Placed successfully.", true, primaryColor)
                  ],
                ),
                actions: <Widget>[
                  Center(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      onPressed: () {
                        cart.clear();
                        Get.offAll(const Horeca());
                      },
                      child: info('Home', true, whiteColor),
                    ),
                  ),
                ],
              );
            });
      },
      style: buttonstyle(primaryColor, whiteColor, 5),
      child: const Text('Order Now'),
    ),
  );
}

Widget getInvoice() {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(width: 1, color: borderColor),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        ListTile(
          title: myHeading("Order", false),
          trailing: myHeading("5 May 2024", false),
        ),
        ListTile(
          title: info("Bill", false, blackColor),
          trailing: info("\$ 360", false, blackColor),
        ),
        ListTile(
          title: info("Shipping", false, blackColor),
          trailing: info("\$ 0.5", false, blackColor),
        ),
        Divider(
          color: borderColor,
        ),
        ListTile(
          title: myHeading("Total", false),
          trailing: myHeading("\$ 360.5", false),
        ),
      ],
    ),
  );
}
