import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';
import 'package:horeca/screens/auth/login.dart';

class Verify extends StatelessWidget {
  const Verify({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: primaryColor,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizeBox(20),
                    myTitle("Forgot \npassword?", false, primaryColor),
                    sizeBox(20),
                    TextField(
                      decoration:
                          inputStyle(Icons.person, 'Enter your email address'),
                    ),
                    sizeBox(20),
                    info(
                        '* We will send you a message to set or reset your new password',false),
                    sizeBox(40),
                    moveButtom(
                      'Submit',
                      context,
                      const Login(),
                      true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: getCurveBorder(),
      ),
    );
  }
}
