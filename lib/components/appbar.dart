import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';

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

SliverAppBar mySliverAppBar(String title) {
  return SliverAppBar(
    elevation: 1,
    floating: true,
    snap: true,
    title: myHeading(title, true, primaryColor),
    centerTitle: true,
    backgroundColor: fillColor,
  );
}

SliverAppBar mainSliverAppBar(String img) {
  return SliverAppBar(
    leading: DrawerButton(
      style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(primaryColor),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent)),
    ),
    title: getSVGLogo(25),
    elevation: 1,
    floating: true,
    snap: true,
    centerTitle: true,
    backgroundColor: fillColor,
    actions: [
      CircleAvatar(
        backgroundImage: AssetImage(img),
      ),
      sizeBox(10),
    ],
  );
}
