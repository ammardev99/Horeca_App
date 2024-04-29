import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horeca/models/onboarding.dart';
import 'package:horeca/screens/components/assets.dart';
import 'package:horeca/screens/components/widgets.dart';
import '../auth/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  PageController _controller = PageController();
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            sizeBox(60),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingDataList.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                            child: myTitle(onboardingDataList[index].title,
                                true, primaryColor)),
                        sizeBox(40),
                        Image.asset(onboardingDataList[index].imagePath),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingDataList.length,
                (index) => buildDot(index),
              ),
            ),
            sizeBox(15),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 80),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex < onboardingDataList.length - 1) {
                      _controller.animateToPage(
                        currentIndex + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Get.offAll(const Login());
                    }
                  });
                },
                style: buttonstyle(primaryColor, whiteColor, 5),
                child: Text(currentIndex == onboardingDataList.length - 1
                    ? "Continue"
                    : "Next"),
              ),
            ),
            sizeBox(40),
          ],
        ),
      ),
    );
  }

  InkWell buildDot(int i) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        setState(() {
          currentIndex = i;
          if (currentIndex < onboardingDataList.length) {
            _controller.animateToPage(
              currentIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }
        });
      },
      child: Container(
        height: 10,
        width: currentIndex == i ? 55 : 35,
        margin: const EdgeInsets.symmetric(horizontal: 1),
        decoration: BoxDecoration(
          color: currentIndex == i ? primaryColor : borderColor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
      ),
    );
  }
}
