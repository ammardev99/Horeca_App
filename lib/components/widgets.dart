import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:horeca/components/assets.dart';

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

Widget myHeading(String text, bool align, [Color? color]) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    ),
    textAlign: align==true? TextAlign.center: TextAlign.left,
  );
}
Widget myBoldHeading(String text, [Color? color]) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    ),
  );
}

Widget getCurveBorder() {
  return Image.asset(
    'assets/images/bottom_curve.png',
    fit: BoxFit.fitWidth,
  );
}

Widget info(String text, bool align ,[Color? color]) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color ?? borderColor,
    ),
    textAlign: align == true ? TextAlign.center : TextAlign.left,
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
      info(text, false),
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
          child: info(label,false ,primaryColor))
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

Widget getSVGLogo(double h) {
  return SizedBox(height: h, child: SvgPicture.asset('assets/images/logo.svg'));
}

Widget categoryOption(String img, String tag) {
  return InkWell(
    borderRadius: BorderRadius.circular(5),
    hoverColor: Colors.transparent,
    splashColor: primaryLightColor,
    onTap: () {},
    child: SizedBox(
      width: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            maxRadius: 30,
            backgroundImage: AssetImage(img),),
          info(tag, true ,primaryColor)
        ],
      ),
    ),
  );
}



Widget textIconButton(String text, IconData icon, [page]){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    decoration: BoxDecoration(
    color: whiteColor.withOpacity(0.8),
      borderRadius: BorderRadius.circular(6),
      border: Border.all(width: 1 , color: primaryLightColor)
    ),  
    child: Row(children: [
      info(text, true, primaryColor),
      sizeBox(8),
      Icon(icon, color: primaryColor,)
    ],),
  );
}