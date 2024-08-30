import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:summer_project/common/widgets/success_screen/success_screen.dart';
import 'package:summer_project/screens/login/login.dart';
import 'package:summer_project/screens/signup/input.dart';
import 'package:summer_project/utils/constants/image_strings.dart';
import 'package:summer_project/utils/constants/sizes.dart';
import 'package:summer_project/utils/constants/text_strings.dart';
import 'package:summer_project/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.offAll(() => const LoginScreen()),
                icon: const Icon(CupertinoIcons.clear)),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // Image
                Image(
                  image: const AssetImage(TImages.deliveredEmailIllustration),
                  width: THelperFunctions.screenWidth() * 0.7,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                // Title and SubTitle
                Text(TTexts.confirmEmail,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  'rudrasuthar04@gmail.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                Text(TTexts.confirmEmailSubTitle,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: TSizes.spaceBtwSections),

                // Buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text(TTexts.tContinue),
                    onPressed: () {
                      Get.to(() => SuccessScreen(
                            image: TImages.staticSuccessIllustration,
                            title: TTexts.yourAccountCreatedTitle,
                            subtitle: TTexts.yourAccountCreatedSubTitle,
                            onPressed: () {
                              Get.to(() => ProfileInputPage());
                            },
                          ));
                    },
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    child: const Text(TTexts.resendEmail),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
