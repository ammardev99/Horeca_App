import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';
import 'package:horeca/models/product.dart';
import 'package:horeca/screens/horeca/inner%20screens/show_cart.dart';

class ItemInfo extends StatefulWidget {
  final int productId;

  const ItemInfo({super.key, required this.productId});

  @override
  State<ItemInfo> createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: primaryColor,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(const ShowCart());
              },
              child: textIconButton(
                cart.length.toString(),
                Icons.shopping_cart_outlined,
              ),
            ),

            // IconButton(
            //     onPressed: () {},
            //     icon: Icon(
            //       Icons.shopping_cart_outlined,
            //       color: primaryColor,
            //     )),
            //     info(cart.length.toString(), true),
            sizeBox(20)
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizeBox(20),
              Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: primaryLightColor,
                    image: DecorationImage(
                      image:
                          AssetImage(productList[widget.productId - 1].image),
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
              sizeBox(20),
              myHeading(
                  productList[widget.productId - 1].title, false, primaryColor),
              sizeBox(10),
              info(productList[widget.productId - 1].description, false,
                  blackColor),
              info(productList[widget.productId - 1].description, false,
                  blackColor),
              info(productList[widget.productId - 1].description, false,
                  blackColor),
              sizeBox(20),
              myHeading('\$${productList[widget.productId - 1].price}', false,
                  primaryColor),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      addItemToCart(widget.productId - 1);
                    });
                  },
                  style: buttonstyle(primaryColor, whiteColor, 5),
                  child: const Text('Add to Cart'),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
