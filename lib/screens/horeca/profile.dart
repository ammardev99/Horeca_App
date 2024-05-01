import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';
import 'package:horeca/screens/auth/login.dart';
import 'package:horeca/screens/horeca/inner%20screens/address_details.dart';
import 'package:horeca/screens/horeca/inner%20screens/order_history.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: myHeading("Profile", true, primaryColor),
          centerTitle: true,
          elevation: 1,
        ),
        // backgroundColor: secondaryColor,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              getProfileInfo(),
              sizeBox(15),
              profileOption("Address Details", const AddressDetails()),
              sizeBox(15),
              profileOption("Order History", const OrderHistory()),
              sizeBox(15),
              profileOption("Log Out", const Login()),
            ],
          ),
        ));
  }
}
