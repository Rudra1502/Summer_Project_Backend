import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summer_project/screens/login/login.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _userName = "John Doe"; // Example user name
  String _email = "john.doe@example.com"; // Example email
  String _profileImagePath =
      "assets/profile_placeholder.png"; // Placeholder image path
  List<String> _completedJobs = [
    "Job 1",
    "Job 2",
    "Job 3"
  ]; // Example completed jobs
  bool _isDropdownExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Section
            Center(
              child: Column(
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     _editProfileImage();
                  //   },
                  //   child: CircleAvatar(
                  //     radius: 50,
                  //     backgroundImage: AssetImage(_profileImagePath),
                  //   ),
                  // ),
                  // SizedBox(height: 10),
                  Text(
                    _userName,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    _email,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      _editProfile(context);
                    },
                    child: Text("Edit Profile"),
                  ),
                ],
              ),
            ),
            Divider(),
            // Jobs Completed Dropdown
            ExpansionTile(
              title: Text("Jobs Completed"),
              trailing: Icon(_isDropdownExpanded
                  ? Icons.arrow_drop_up
                  : Icons.arrow_drop_down),
              onExpansionChanged: (expanded) {
                setState(() {
                  _isDropdownExpanded = expanded;
                });
              },
              children: _completedJobs
                  .map((job) => ListTile(title: Text(job)))
                  .toList(),
            ),
            Divider(),
            // Settings Options
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Change Password"),
              onTap: () {
                _showChangePasswordDialog(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Get.offAll(LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editProfileImage() {
    // Implement profile image edit functionality
    // For example, you could open the gallery to select a new image
  }

  void _editProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newUserName = _userName;
        String newEmail = _email;
        return AlertDialog(
          title: Text("Edit Profile"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Name"),
                controller: TextEditingController(text: _userName),
                onChanged: (value) {
                  newUserName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Email"),
                controller: TextEditingController(text: _email),
                onChanged: (value) {
                  newEmail = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _userName = newUserName;
                  _email = newEmail;
                });
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController reEnterPasswordController =
        TextEditingController();
    bool passwordsMatch = true;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Change Password"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: newPasswordController,
                    decoration: InputDecoration(labelText: "New Password"),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        passwordsMatch =
                            value == reEnterPasswordController.text;
                      });
                    },
                  ),
                  TextField(
                    controller: reEnterPasswordController,
                    decoration: InputDecoration(
                      labelText: "Re-enter New Password",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: passwordsMatch ? Colors.grey : Colors.red,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: passwordsMatch ? Colors.teal : Colors.red,
                        ),
                      ),
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        passwordsMatch = value == newPasswordController.text;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: passwordsMatch
                      ? () {
                          Navigator.of(context).pop();
                          _showPasswordChangedDialog(context);
                        }
                      : null, // Disable button if passwords do not match
                  child: Text("Change Password"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showPasswordChangedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Password Changed"),
          content: Text("Your password has been changed successfully."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
