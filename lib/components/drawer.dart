import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';

Drawer myDrawer(BuildContext context) {
  return Drawer(
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
            children: [
      // close 
      ListTile(
        leading: Icon(Icons.arrow_back, color: primaryColor,),
        title: info("Close", false, blackColor),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      // Option 
      ExpansionTile(
        title: myHeading("Kühlprodukte", false),
        childrenPadding: const EdgeInsets.only(left: 20),
        children: [
          drawerOption("Milchprodukte",),
          drawerOption("Fleischprodukte"),
          drawerOption("Kartoffel-/Teigprodukte"),
        ],
      ),
      // Option 
      ExpansionTile(
        title: myHeading("TK", false),
        childrenPadding: const EdgeInsets.only(left: 20),
        children: [
          drawerOption("Milchprodukte",),
          drawerOption("Fleischprodukte"),
          drawerOption("Kartoffel-/Teigprodukte"),
        ],
      ),
      // Option 
      ExpansionTile(
        title: myHeading("Trockenware", false),
        childrenPadding: const EdgeInsets.only(left: 20),
        children: [
          drawerOption("Milchprodukte",),
          drawerOption("Fleischprodukte"),
          drawerOption("Kartoffel-/Teigprodukte"),
        ],
      ),
      // Option 
      ExpansionTile(
        title: myHeading("Obst und Gemüse", false),
        childrenPadding: const EdgeInsets.only(left: 20),
        children: [
          drawerOption("Milchprodukte",),
          drawerOption("Fleischprodukte"),
          drawerOption("Kartoffel-/Teigprodukte"),
        ],
      ),
      // Option 
      ExpansionTile(
        title: myHeading("Getränke", false),
        childrenPadding: const EdgeInsets.only(left: 20),
        children: [
          drawerOption("Milchprodukte",),
          drawerOption("Fleischprodukte"),
          drawerOption("Kartoffel-/Teigprodukte"),
        ],
      ),
      // Option 
      ExpansionTile(
        title: myHeading("Verpackung", false),
        childrenPadding: const EdgeInsets.only(left: 20),
        children: [
          drawerOption("Milchprodukte",),
          drawerOption("Fleischprodukte"),
          drawerOption("Kartoffel-/Teigprodukte"),
        ],
      ),
            ],
          ),
    ),
  );
}

Widget drawerOption(String label) {
  return ListTile(
    title: info(label, false, blackColor),
    onTap: () {},
    splashColor: primaryLightColor,
    contentPadding: const EdgeInsets.only(left: 10),
  );
}
