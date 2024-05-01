import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';
import 'package:horeca/screens/horeca.dart';
import 'package:horeca/screens/horeca/appbar.dart';

class AddressDetails extends StatefulWidget {
  const AddressDetails({super.key});

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: titleAppBar("Address Details"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizeBox(20),
            myHeading("Zip Code", false),
            sizeBox(10),
            TextField(
              decoration: inputstylenoIcon('Enter zip code'),
            ),
            sizeBox(20),
            myHeading("Address", false),
            sizeBox(10),
            TextField(
              decoration: inputstylenoIcon('Enter Address'),
            ),
            sizeBox(20),
            myHeading("City", false),
            sizeBox(10),
            TextField(
              decoration: inputstylenoIcon('Enter city'),
            ),
            sizeBox(20),
            myHeading("State", false),
            sizeBox(10),
            TextField(
              decoration: inputstylenoIcon('Enter state'),
            ),
            sizeBox(20),
            myHeading("Country", false),
            sizeBox(10),
            TextField(
              decoration: inputstylenoIcon('Enter country'),
            ),
            sizeBox(40),
            moveButtom(
              'Save',
              context,
              const Horeca(),
              true,
            ),
          ],
        ),
      ),
    ));
  }
}
