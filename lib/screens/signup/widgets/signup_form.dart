import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:summer_project/screens/login/login.dart';
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
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _resumeLinkController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  List<TextEditingController> _skillControllers = [];
  List<String> skills = [];
  final AuthService _authService = AuthService();

  String? _errorMessage;
  void _addSkillField() {  
    setState(() {
      _skillControllers.add(TextEditingController());
    });
  }

  void _addSkill() {
   void _addSkillField() {
  setState(() {
    _skillControllers.add(TextEditingController());  // CORRECT: Adding a new TextEditingController to the list
  });
}

  }

  Future<void> _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      final firstName = _firstNameController.text.trim();
      final lastName = _lastNameController.text.trim();
      final userName = _userNameController.text.trim();
      final email = _emailController.text.trim();
      final phoneNumber = _phoneNumberController.text.trim();
      final password = _passwordController.text.trim();
      final resumeLink = _resumeLinkController.text.trim();
      final bio = _bioController.text.trim();
      skills = _skillControllers
    .map((controller) => controller.text.trim())  // Correct: Accessing text from each controller
    .where((skill) => skill.isNotEmpty)  // Filtering out empty strings
    .toList();  // Converting to a List<String>


      final result = await _authService.registerUser(
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        resumeLink: resumeLink,
        bio: bio,
        skills: skills
      );

      if (result == 'User registered successfully') {
        Get.offAll(LoginScreen());
      } else {
        setState(() {
          _errorMessage = result;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
              controller: _userNameController,
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
            // Resume LInk
            TextFormField(
                controller: _resumeLinkController,
                decoration: const InputDecoration(
                  labelText: 'Resume Link',
                  prefixIcon: Icon(Iconsax.link),
                ),
                validator: (value) {
                 if (value == null || value.isEmpty) {
                  return 'Please enter your resume link';
                }
                  return null;
                },
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                controller: _bioController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                  prefixIcon: Icon(Iconsax.note),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                  return 'Please enter your bio';
                }
                  return null;
                },
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              
              Column(
                children: List.generate(_skillControllers.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _skillControllers[index],
                            decoration: const InputDecoration(
                              labelText: 'Skill',
                              prefixIcon: Icon(Iconsax.tag),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a skill';
                              }
                              return null;
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(Iconsax.close_circle),
                          onPressed: () {
                            setState(() {
                              _skillControllers.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ),

              // NEW: Button to Add More Skills
              TextButton.icon(
                onPressed: _addSkillField,
                icon: Icon(Iconsax.add),
                label: Text('Add Another Skill'),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              
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
