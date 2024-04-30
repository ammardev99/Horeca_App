import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';
import 'package:horeca/models/product.dart';

import 'item_info.dart';

Widget productCard(Product item) {
  return InkWell(
    borderRadius: BorderRadius.circular(10),
    splashColor: primaryColor,
    onTap: () {
      Get.to(ItemInfo(productId: item.id));
    },
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// product image and title
          Container(
              width: double.infinity,
              height: 125,
              decoration: BoxDecoration(
                color: primaryLightColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Image.asset(item.image)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: myHeading(
                    item.title,
                    false,
                  ),
                  subtitle: Text(
                    item.description,
                  ),
                ),
                myBoldHeading('\$${item.price.toString()}'),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
