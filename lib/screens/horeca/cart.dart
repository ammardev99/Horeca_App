import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horeca/components/appbar.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';
import 'package:horeca/models/product.dart';
import 'package:horeca/screens/horeca/inner%20screens/checkout.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [mySliverAppBar("Cart")];
        },
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
// cart list
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: MediaQuery.of(context).size.height - 100,
                  child: cart.isEmpty
                      ? Center(
                          child: info("Cart is empty", true, primaryColor),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
// show count number of item in cart
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: myHeading("${cart.length} Items", false,
                                    primaryColor)),

                            Expanded(
                                child: ListView.builder(
                              itemCount: cart.length,
                              itemBuilder: (context, index) {
                                return cartItemTile(index);
                              },
                            )),
                          ],
                        ),
                ),
// cart CheckOut
                cart.isEmpty ? sizeBox(0) : showCheckout()
              ],
            )),
        //
        //
      ),
    );
  }

  Widget cartItemTile(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: fillColor.withOpacity(0.8),
          border: Border.all(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        splashColor: primaryLightColor,
        onTap: () {
          popup(index, false);
        },
// item image
        leading: CircleAvatar(
          foregroundImage: AssetImage(
            cart[index].image.toString(),
          ),
          backgroundColor: Colors.transparent,
        ),
// item name
        title: myHeading(cart[index].title, false),
// item price
        subtitle: info('\$ ${cart[index].price.toString()}', false, blackColor),
// delete item
        trailing: IconButton(
            onPressed: () {
              popup(index, true);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ),
    );
  }

  Future popup(index, bool delete) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: whiteColor,
            content: popupItemDetails(index),
            actions: <Widget>[
              Center(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        delete == true ? Colors.red : primaryColor),
                  ),
                  onPressed: () {
                    setState(() {
                      delete == true
                          ? {
                              removeItemToCart(index),
                              Navigator.of(context).pop()
                            }
                          : Navigator.of(context).pop();
                    });
                  },
                  child: delete == true
                      ? info('Delete', true, whiteColor)
                      : info('ok', true, whiteColor),
                ),
              ),
            ],
          );
        });
  }

  Widget popupItemDetails(int index) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          sizeBox(15),
          Container(
            height: 80,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    cart[index].image,
                  ),
                ),
                borderRadius: BorderRadius.circular(5)),
          ),
          sizeBox(15),
          myHeading(cart[index].title, false, primaryColor),
          sizeBox(10),
          info(cart[index].description, false, blackColor),
          info(cart[index].description, false, blackColor),
          sizeBox(15),
          myHeading('\$${cart[index].price}', false, primaryColor),
        ]);
  }

  Widget showCheckout() {
    return Positioned(
      bottom: 65,
      left: 0,
      right: 0,
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: ListTile(
            title: myHeading('Total Bill', false, whiteColor),
            subtitle: info("\n\$4561.50", false, whiteColor),
            trailing: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(whiteColor),
                ),
                onPressed: () {
                  Get.to(const Checkout());
                },
                child: info("Checkout", false, primaryColor)),
          ),
        ),
      ),
    );
  }
}
