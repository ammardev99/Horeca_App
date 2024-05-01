import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';

AppBar horecaAppBar() {
  return AppBar(
    leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: primaryColor,
        )),
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

AppBar titleAppBar(String title) {
  return AppBar(
    leading: BackButton(
      color: primaryColor,
    ),
    title: myHeading(title, true, primaryColor),
    centerTitle: true,
    elevation: 1,
  );
}
