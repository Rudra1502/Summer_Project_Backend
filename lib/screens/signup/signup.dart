import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:summer_project/common/widgets/login_signup/form_divider.dart';
import 'package:summer_project/common/widgets/login_signup/social_buttons.dart';
import 'package:summer_project/screens/signup/widgets/signup_form.dart';
import 'package:summer_project/utils/constants/sizes.dart';
import 'package:summer_project/utils/constants/text_strings.dart';
import 'package:recase/recase.dart';  // Add this import if you're using Recase

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Form
              const TSignUpForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Footer
              const TSocialButton(),
            ],
          ),
        )));
  }
}
