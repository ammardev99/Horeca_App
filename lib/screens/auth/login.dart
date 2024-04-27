import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horeca/screens/components/assets.dart';
import 'package:horeca/screens/components/widgets.dart';
import 'package:horeca/screens/auth/signup.dart';
import 'package:horeca/screens/auth/verify.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordinVisible = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizeBox(40),
                myTitle("Welcome \nBack!", false, primaryColor),
                sizeBox(20),
                // Username or Email
                TextField(
                  decoration: inputStyle(Icons.mail, 'Username or Email'),
                ),
                sizeBox(20),
                // Password
                TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
                sizeBox(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    rememberPassword(),
                    GestureDetector(
                        onTap: () {
                          Get.to(const Verify());
                        },
                        child: info("Forgot the password?", Colors.red)),
                  ],
                ),
                sizeBox(40),
                moveButtom(
                  'Login',
                  context,
                  const Login(),
                  true,
                ),
                sizeBox(40),
                Center(child: info('- OR Continue with -')),
                sizeBox(10),
                infoAction(
                  "Create An Account",
                  "Sign up",
                  const Signup(),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: getCurveBorder(),
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
          info("Remember me", primaryColor),
        ],
      ),
    );
  }
}
