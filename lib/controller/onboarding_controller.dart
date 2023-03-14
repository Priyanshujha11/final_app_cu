
import 'package:final_app_cu/view/phone_signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingController extends GetxController {
  late Material materialButton;
  RxInt index = 0.obs;
  Material get materialButtonGetter => materialButton;
  final onboardingPagesList = [
    PageModel(
      widget: Container(
        width: Get.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.width * 0.8,
              width: Get.width * 0.8,
              child: const Placeholder(),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              'Heading text 1',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Welcome to Bizconnect! Let\'s get started with a quick tour of our app\'s features',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: Container(
        width: Get.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.width * 0.8,
              width: Get.width * 0.8,
              child: const Placeholder(),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              'Heading text 2',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Welcome to Bizconnect! Let\'s get started with a quick tour of our app\'s features',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: Container(
        width: Get.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.width * 0.8,
              width: Get.width * 0.8,
              child: const Placeholder(),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              'Heading text 3',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Welcome to Bizconnect! Let\'s get started with a quick tour of our app\'s features',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    materialButton = skipButton();
  }

  Material skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: const Color(0xff2B2A29),
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index.value = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 15.0,
          ),
          child: Text(
            'Skip',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Material get signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: const Color(0xff2B2A29),
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          Get.to(MyPhone());
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 15.0,
          ),
          child: Text(
            'Sign up',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
