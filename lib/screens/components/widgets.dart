import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horeca/screens/components/assets.dart';

Widget myTitle(String text, bool align, [Color? color]) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: color,
    ),
    textAlign: align == true ? TextAlign.center : TextAlign.left,
  );
}

Widget sizeBox(double w, [double? h]) {
  return SizedBox(
    width: w,
    height: h ?? w,
  );
}

Widget indicator() {
  return Row(
    children: [
      ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            width: 20,
            height: 5,
            color: Colors.amber,
          );
        },
      )
    ],
  );
}

Widget myHeading(String text, [Color? color]) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    ),
  );
}

Widget getCurveBorder() {
  return Image.asset('assets/images/bottom_curve.png', fit: BoxFit.fitWidth,);
}

Widget info(String text, [Color? color]) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color ?? borderColor,
    ),
    textAlign: TextAlign.justify,
  );
}

Widget infoAction(
  String text,
  String label,
  page,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      info(text),
      sizeBox(2),
      TextButton(
          onPressed: () {
            if (page != null) {
              Get.to(page);
            }
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          child: info(label, primaryColor))
    ],
  );
}

Widget moveButtom(String text, context, page, bool redriect, [double? width]) {
  return SizedBox(
    width: width ?? double.infinity,
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        if (page != null) {
          redriect == true ? Get.offAll(page) : Get.to(page);
        }
      },
      style: buttonstyle(primaryColor, whiteColor, 5),
      child: Text(text),
    ),
  );
}
