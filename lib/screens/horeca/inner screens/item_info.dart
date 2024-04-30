import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';
import 'package:horeca/models/product.dart';

class ItemInfo extends StatelessWidget {
  final int productId;

  const ItemInfo({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: primaryColor,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: primaryColor,
                )),
            sizeBox(10)
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
                            AssetImage(productDataList[productId - 1].image), ),
                    borderRadius: BorderRadius.circular(10)),
              ),
              sizeBox(20),
              myHeading(productDataList[productId - 1].title, false, primaryColor),
              sizeBox(10),
              info(productDataList[productId - 1].description, false, blackColor),
              info(productDataList[productId - 1].description, false, blackColor),
              info(productDataList[productId - 1].description, false, blackColor),
              sizeBox(20),
              myHeading('\$${productDataList[productId - 1].price}', false, primaryColor)
            ],
          ),
        ),
      ),
    );
  }
}
