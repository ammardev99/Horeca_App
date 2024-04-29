import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'components/assets.dart';
import 'horeca/cart.dart';
import 'horeca/products.dart';
import 'horeca/profile.dart';
import 'horeca/setting.dart';
import 'horeca/home.dart';

class Horeca extends StatefulWidget {
  const Horeca({super.key});

  @override
  State<Horeca> createState() => _HorecaState();
}

class _HorecaState extends State<Horeca> {
  int visitScreen = 0;

  List<TabItem> screenItems = [
    const TabItem(
      icon: Icons.home_outlined,
      title: 'Home',
    ),
    const TabItem(
      icon: Icons.shopping_bag_outlined,
      title: 'Products',
    ),
    const TabItem(
      icon: Icons.shopping_cart_outlined,
      title: 'Cart',
    ),
    const TabItem(
      icon: Icons.person_outline,
      title: 'Profile',
    ),
    const TabItem(
      icon: Icons.settings_outlined,
      title: 'Settings',
    ),
  ];

  final screen = [
    const Home(),
    const Products(),
    const Cart(),
    const Profile(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: screen[visitScreen],
        bottomNavigationBar: bottomBar(),
      ),
    );
  }

  BottomBarCreative bottomBar() {
    return BottomBarCreative(
      highlightStyle: const HighlightStyle(
        elevation: 1,
      ),
      enableShadow: true,
      isFloating: true,
      items: screenItems,
      backgroundColor: whiteColor,
      color: blackColor,
      colorSelected: primaryColor,
      indexSelected: visitScreen,
      paddingVertical: 25,
      onTap: (int index) => setState(() {
        visitScreen = index;
      }),
    );
  }
}
