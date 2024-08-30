import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:summer_project/screens/login/login.dart';

class ProfileInputPage extends StatefulWidget {
  @override
  _ProfileInputPageState createState() => _ProfileInputPageState();
}

class _ProfileInputPageState extends State<ProfileInputPage> {
  File? _profileImage;
  final _skillsController = TextEditingController();
  final _portfolioLinkController = TextEditingController();
  final _bioController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _skillsController.dispose();
    _portfolioLinkController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Center(
            //   child: GestureDetector(
            //     onTap: _pickImage,
            //     child: Stack(
            //       children: [
            //         CircleAvatar(
            //           radius: 60,
            //           backgroundImage: _profileImage != null
            //               ? FileImage(_profileImage!)
            //               : AssetImage('assets/5856.jpg') as ImageProvider,
            //           backgroundColor: Colors.grey[200],
            //         ),
            //         Positioned(
            //           bottom: 0,
            //           right: 0,
            //           child: Container(
            //             padding: EdgeInsets.all(8),
            //             decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Colors.teal,
            //             ),
            //             child: Icon(
            //               Icons.camera_alt,
            //               color: Colors.white,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(height: 30),
            _buildInputCard(
              title: 'Skills',
              hintText: 'Enter your skills separated by commas',
              controller: _skillsController,
              icon: Icons.build,
            ),
            SizedBox(height: 20),
            _buildInputCard(
              title: 'Portfolio Link',
              hintText: 'Enter your portfolio URL',
              controller: _portfolioLinkController,
              icon: Icons.link,
            ),
            SizedBox(height: 20),
            _buildInputCard(
              title: 'Bio/Summary',
              hintText: 'Write a short bio or summary about yourself',
              controller: _bioController,
              icon: Icons.person,
              maxLines: 5,
            ),
            SizedBox(height: 40),
            // ElevatedButton(
            //   onPressed: () {
            //     _submitProfile();
            //   },
            //   child: Text(
            //     'Submit',
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.symmetric(vertical: 18),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     backgroundColor: Colors.teal,
            //     onPrimary: Colors.white,
            //   ),
            // ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _submitProfile();
                  Get.offAll(() => const LoginScreen());
                },
                child: const Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputCard({
    required String title,
    required String hintText,
    required TextEditingController controller,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitProfile() {
    final skills = _skillsController.text;
    final portfolioLink = _portfolioLinkController.text;
    final bio = _bioController.text;

    // Handle form submission (e.g., send data to the backend or save locally)
    print('Profile Picture: $_profileImage');
    print('Skills: $skills');
    print('Portfolio Link: $portfolioLink');
    print('Bio: $bio');

    // You can add more functionality here, like saving the data or navigating to another page.
  }
}
