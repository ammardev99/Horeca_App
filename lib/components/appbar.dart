import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';

AppBar horecaAppBar() {
  return AppBar(
    leading: DrawerButton(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(primaryColor)
      ),
    ),
    centerTitle: true,
    title: getSVGLogo(25),
    actions: [
      const CircleAvatar(
        backgroundImage: AssetImage('assets/png/profile.png'),
      ),
      sizeBox(10),
    ],
  );
}

AppBar innerTitleAppBar(String title) {
  return AppBar(
    leading: BackButton(
      color: primaryColor,
    ),
    title: myHeading(title, true, primaryColor),
    centerTitle: true,
    elevation: 1,
  );
}

AppBar mainTitleAppBar(String title) {
  return AppBar(
    title: myHeading(title, true, primaryColor),
    centerTitle: true,
    elevation: 1,
  );
}
