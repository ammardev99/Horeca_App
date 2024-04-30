import 'package:flutter/material.dart';
import 'package:horeca/components/assets.dart';
import 'package:horeca/components/widgets.dart';
import 'package:horeca/screens/auth/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool passwordinVisible = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizeBox(40),
                    myTitle("Create an \naccount", false, primaryColor),
                    sizeBox(20),
                    // Username or Email
                    TextField(
                      decoration: inputStyle(Icons.person, 'Name'),
                    ),
                    sizeBox(20),
                    TextField(
                      decoration: inputStyle(Icons.phone, 'Phone'),
                    ),
                    sizeBox(20),
                    TextField(
                      decoration: inputStyle(Icons.mail, 'Email'),
                    ),
                    sizeBox(20),
                    TextField(
                      decoration: inputStyle(Icons.location_on, 'Address'),
                    ),
                    sizeBox(20),
                    // Password
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 25,
                          color: primaryColor,
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: primaryColor),
                        fillColor: fillColor,
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordinVisible =
                                  passwordinVisible == true ? false : true;
                            });
                          },
                          icon: passwordinVisible == true
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          color: borderColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: borderColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                      ),
                      obscureText: passwordinVisible,
                    ),
                    sizeBox(20),
                    // Confirm Password
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 25,
                          color: primaryColor,
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: primaryColor),
                        fillColor: fillColor,
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordinVisible =
                                  passwordinVisible == true ? false : true;
                            });
                          },
                          icon: passwordinVisible == true
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          color: borderColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: borderColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                      ),
                      obscureText: passwordinVisible,
                    ),
                    sizeBox(40),
                    moveButtom(
                      'Signup',
                      context,
                      const Login(),
                      true,
                    ),
                    sizeBox(40),
                    Center(child: info('- OR Continue with -',false,)),
                    sizeBox(10),
                    infoAction(
                      "I Already Have an Account",
                      "Login",
                      const Login(),
                    ),
                  ],
                ),
              ),
              getCurveBorder()
            ],
          ),
        ),
        // bottomNavigationBar: getCurveBorder(),
      ),
    );
  }

  GestureDetector rememberPassword() {
    return GestureDetector(
      onTap: () {
        setState(() {
          rememberMe = !rememberMe;
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: rememberMe,
            onChanged: (value) {
              setState(() {
                rememberMe = value!;
              });
            },
            activeColor: primaryColor,
            splashRadius: 0,
            side: BorderSide(
              color: primaryColor,
              width: 2,
            ),
          ),
          info("Remember me",false, primaryColor),
        ],
      ),
    );
  }
}
