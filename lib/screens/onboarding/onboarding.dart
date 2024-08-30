import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:summer_project/screens/onboarding/controllers/onboarding_controller.dart';
import 'package:summer_project/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:summer_project/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:summer_project/screens/onboarding/widgets/onboarding_page.dart';
import 'package:summer_project/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:summer_project/utils/constants/image_strings.dart';
import 'package:summer_project/utils/constants/text_strings.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
                image: TImages.onBoardingImage1,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
                image: TImages.onBoardingImage2,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
                image: TImages.onBoardingImage3,
              )
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
