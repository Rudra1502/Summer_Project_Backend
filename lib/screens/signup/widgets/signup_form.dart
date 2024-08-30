import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:summer_project/screens/signup/input.dart';
import 'package:summer_project/screens/signup/verify_email.dart';
import 'package:summer_project/screens/signup/widgets/terms_and_conditions_checkbox.dart';
import 'package:summer_project/services/signup_service.dart';
import 'package:summer_project/utils/constants/sizes.dart';
import 'package:summer_project/utils/constants/text_strings.dart';

class TSignUpForm extends StatefulWidget {
  const TSignUpForm({Key? key}) : super(key: key);

  @override
  _TSignUpFormState createState() => _TSignUpFormState();
}

class _TSignUpFormState extends State<TSignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  String? _errorMessage;

  Future<void> _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      final firstName = _firstNameController.text.trim();
      final lastName = _lastNameController.text.trim();
      final userName = _usernameController.text.trim();
      final email = _emailController.text.trim();
      final phoneNumber = _phoneNumberController.text.trim();
      final password = _passwordController.text.trim();

      final result = await _authService.registerUser(
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );

      if (result == 'User registered successfully') {
        Get.to(() => ProfileInputPage());
      } else {
        setState(() {
          _errorMessage = result;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Form(
    //   key: _formKey,
    //   child: Column(
    //     children: [
    //       TextFormField(
    //         controller: _firstNameController,
    //         decoration: const InputDecoration(labelText: 'First Name'),
    //         validator: (value) {
    //           if (value == null || value.isEmpty) {
    //             return 'Please enter your first name';
    //           }
    //           return null;
    //         },
    //       ),
    //       TextFormField(
    //         controller: _lastNameController,
    //         decoration: const InputDecoration(labelText: 'Last Name'),
    //         validator: (value) {
    //           if (value == null || value.isEmpty) {
    //             return 'Please enter your last name';
    //           }
    //           return null;
    //         },
    //       ),
    //       TextFormField(
    //         controller: _usernameController,
    //         decoration: const InputDecoration(labelText: 'Username'),
    //         validator: (value) {
    //           if (value == null || value.isEmpty) {
    //             return 'Please enter your username';
    //           }
    //           return null;
    //         },
    //       ),
    //       TextFormField(
    //         controller: _emailController,
    //         decoration: const InputDecoration(labelText: 'Email'),
    //         validator: (value) {
    //           if (value == null || value.isEmpty) {
    //             return 'Please enter your email';
    //           }
    //           return null;
    //         },
    //       ),
    //       TextFormField(
    //         controller: _phoneNumberController,
    //         decoration: const InputDecoration(labelText: 'Phone Number'),
    //         validator: (value) {
    //           if (value == null || value.isEmpty) {
    //             return 'Please enter your phone number';
    //           }
    //           return null;
    //         },
    //       ),
    //       TextFormField(
    //         controller: _passwordController,
    //         decoration: const InputDecoration(labelText: 'Password'),
    //         obscureText: true,
    //         validator: (value) {
    //           if (value == null || value.isEmpty) {
    //             return 'Please enter your password';
    //           }
    //           return null;
    //         },
    //       ),
    //       if (_errorMessage != null) ...[
    //         SizedBox(height: 10),
    //         Text(
    //           _errorMessage!,
    //           style: TextStyle(color: Colors.red),
    //         ),
    //       ],
    //       SizedBox(height: 20),
    //       ElevatedButton(
    //         onPressed: _handleSignUp,
    //         child: Text('Sign Up'),
    //       ),
    //     ],
    //   ),
    // );
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                // FirstName
                Expanded(
                  child: TextFormField(
                      controller: _firstNameController,
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.firstName,
                          prefixIcon: Icon(Iconsax.user)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      }),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),

                // LastName
                Expanded(
                  child: TextFormField(
                    controller: _lastNameController,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // UserName
            TextFormField(
              controller: _usernameController,
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Email
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // PhoneNo.
            TextFormField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                  labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Password
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: Icon(Iconsax.eye_slash)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            if (_errorMessage != null) ...[
              SizedBox(height: 10),
              Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            ],
            const SizedBox(height: TSizes.spaceBtwSections),

            // Terms And Conditions CheckBox
            const TTermsAndConditionsCheckBox(),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _handleSignUp();
                },
                child: const Text(TTexts.createAccount),
              ),
            )
          ],
        ));
  }
}
