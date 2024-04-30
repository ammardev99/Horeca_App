import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:horeca/screens/onboarding/onboarding.dart';

import 'components/assets.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: primaryColor,
    statusBarBrightness: Brightness.light,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF027C56)),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
          duration: 2000,
          splashTransition: SplashTransition.fadeTransition,
          centered: true,
          splash: SvgPicture.asset(
            'assets/images/logo.svg',
            semanticsLabel: 'Foodservices By Kaya Markt',
            width: MediaQuery.of(context).size.width - 100,
          ),
          // nextScreen: const Home()),
          nextScreen: const Onboarding()),
    );
  }
}
