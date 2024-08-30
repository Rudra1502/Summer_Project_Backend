import 'package:flutter/material.dart';
import 'package:summer_project/utils/constants/sizes.dart';
import 'package:summer_project/utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  final String title, subTitle, image;
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                height: THelperFunctions.screenHeight() * 0.7,
                width: THelperFunctions.screenWidth() * 0.8,
                image: AssetImage(image),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
