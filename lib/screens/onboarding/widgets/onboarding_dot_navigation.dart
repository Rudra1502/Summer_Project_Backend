import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:summer_project/screens/onboarding/controllers/onboarding_controller.dart';
import 'package:summer_project/utils/constants/colors.dart';
import 'package:summer_project/utils/device/device_utility.dart';
import 'package:summer_project/utils/helpers/helper_functions.dart';


class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: (TDeviceUtils.getScreenWidth(context) - 115) / 2,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: dark ? TColors.light : TColors.dark,
            dotHeight: 6,
          ),
        ));
  }
}
