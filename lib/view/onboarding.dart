import 'package:final_app_cu/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingController onboardingController = Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<OnboardingController>(
        builder: (controller) {
          return Onboarding(
            pages: controller.onboardingPagesList,
            onPageChange: (int pageIndex) {
              controller.index.value = pageIndex;
            },
            startPageIndex: 0,
            footerBuilder: (context, dragDistance, pagesLength, setIndex) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xffD12123),
                  border: Border.all(
                    width: 0.0,
                    color: const Color(0xffD12123),
                  ),
                ),
                child: ColoredBox(
                  color: const Color(0xffD12123),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45.0,
                      vertical: 40.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIndicator(
                          netDragPercent: dragDistance,
                          pagesLength: pagesLength,
                          indicator: Indicator(
                            indicatorDesign: IndicatorDesign.polygon(
                              polygonDesign: PolygonDesign(
                                polygon: DesignType.polygon_circle,
                                polygonRadius: 8.0,
                                polygonSpacer: 25.0,
                              ),
                            ),
                          ),
                        ),
                        controller.index.value == pagesLength - 1
                            ? controller.signupButton
                            : controller.skipButton(setIndex: setIndex)
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
