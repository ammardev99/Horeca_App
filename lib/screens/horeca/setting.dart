import 'dart:io';
import 'package:flutter/material.dart';
import 'package:horeca/components/appbar.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';
import 'package:horeca/screens/auth/verify.dart';
import 'package:horeca/screens/horeca.dart';
import 'package:image_picker/image_picker.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String? profileImg;
  Future pickImage() async {
    final XFile? pickImg = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickImg != null) {
      setState(() {
        profileImg = pickImg.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: mainTitleAppBar("Settings"),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              editProfile(),
              sizeBox(20),
              myHeading("Full Name", false),
              sizeBox(10),
              TextField(
                decoration: inputstylenoIcon(
                  'Ashifa',
                ),
              ),
              sizeBox(20),
              myHeading("Phone Number", false),
              sizeBox(10),
              TextField(
                decoration: inputstylenoIcon('123 456 7890'),
              ),
              sizeBox(20),
              myHeading("Email Address", false),
              sizeBox(10),
              TextField(
                decoration: inputstylenoIcon('ashifa@gmail.com'),
              ),
              sizeBox(20),
              myHeading("Password", false),
              sizeBox(10),
              TextField(
                enabled: false,
                obscureText: true,
                decoration: inputstylenoIcon('********'),
              ),
              sizeBox(5),
              Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      infoAction(
                          "", "Change Password!", const Verify(), Colors.red),
                    ],
                  )),
              sizeBox(20),
              moveButtom('Save', context, const Horeca(), true),
              sizeBox(80)
            ],
          ),
        ));
  }

  Center editProfile() {
    return Center(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: profileImg == null
                ? const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/png/profile.png'),
                  )
                : CircleAvatar(
                    radius: 40,
                    backgroundImage: FileImage(File(profileImg!)),
                  ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                  splashColor: whiteColor,
                  focusColor: primaryColor,
                  color: primaryColor,
                  onPressed: () {
                    pickImage();
                  },
                  icon: Icon(
                    Icons.edit,
                    color: primaryColor,
                  )))
        ],
      ),
    );
  }
}
