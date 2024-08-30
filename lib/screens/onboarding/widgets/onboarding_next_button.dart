import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:summer_project/screens/onboarding/controllers/onboarding_controller.dart';
import 'package:summer_project/utils/constants/colors.dart';
import 'package:summer_project/utils/constants/sizes.dart';
import 'package:summer_project/utils/device/device_utility.dart';
import 'package:summer_project/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        right: TSizes.defaultSpace,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? TColors.primary : Colors.black,
          ),
          child: const Icon(Iconsax.arrow_right_3),
          onPressed: () => OnBoardingController.instance.nextPage(),
        ));
  }
}
