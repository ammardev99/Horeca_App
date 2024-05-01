import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/screens/auth/login.dart';

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
    textAlign: align == true ? TextAlign.center : TextAlign.left,
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

Widget info(String text, bool align, [Color? color]) {
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
  [Color? color]
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
          child: info(label, false, color??primaryColor))
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
            backgroundImage: AssetImage(img),
          ),
          info(tag, true, primaryColor)
        ],
      ),
    ),
  );
}

Widget textIconButton(String text, IconData icon, [page]) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    decoration: BoxDecoration(
        color: whiteColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 1, color: primaryLightColor)),
    child: Row(
      children: [
        info(text, true, primaryColor),
        sizeBox(8),
        Icon(
          icon,
          color: primaryColor,
        )
      ],
    ),
  );
}

Widget getProfileInfo() {
  return Container(
    decoration: BoxDecoration(
        color: primaryLightColor, borderRadius: BorderRadius.circular(8)),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      leading: const CircleAvatar(
        foregroundImage: AssetImage('assets/png/profile.png'),
      ),
      title: myHeading("Ashifa", false),
      subtitle: info("ashifa@gmail.com", false, blackColor),
    ),
  );
}

Widget profileOption(String label, [page]) {
  return InkWell(
    onTap: () {
      if (page == 'Login') {
        Get.offAll(const Login());
      } else {
        page == null ? "" : Get.to(page);
      }
    },
    borderRadius: BorderRadius.circular(8),
    splashColor: primaryLightColor,
    hoverColor: whiteColor,
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: borderColor),
          borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        title: myHeading(label, false),
        trailing: Icon(
          label == 'Log Out'
              ? Icons.logout_outlined
              : Icons.arrow_forward_ios_rounded,
          color: borderColor,
        ),
      ),
    ),
  );
}

Widget getOrderCard(BuildContext context) {
  return InkWell(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: whiteColor,
            title: myHeading("Order Details", true, primaryColor),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: myHeading("Order ID", false),
                  subtitle: info("Items 12", false, blackColor),
                  trailing: Column(
                    children: [
                      info("#12345", false, blackColor),
                      info("\$25.94", false, blackColor),
                    ],
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Center(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(borderColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: info('close', true, blackColor),
                ),
              ),
            ],
          );
        },
      );
    },
    borderRadius: BorderRadius.circular(8),
    splashColor: primaryLightColor,
    hoverColor: whiteColor,
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: borderColor),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: myHeading('Order ID', false),
            subtitle: info("items 2", false),
            trailing: Column(
              children: [
                info("#12345", false, blackColor),
                info("\$25.94", false),
              ],
            ),
          ),
          Divider(
            color: borderColor,
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Icon(
              Icons.circle,
              size: 15,
              color: primaryColor,
            ),
            title: info("text", false),
            trailing: const Text("T.ID: 231561231"),
          ),
        ],
      ),
    ),
  );
}
