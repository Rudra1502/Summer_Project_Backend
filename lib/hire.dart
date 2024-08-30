import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summer_project/main_page.dart';

class CreateJobPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            pinned: false,
            expandedHeight: kToolbarHeight, // Set to standard AppBar height
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(
                  left: 16.0,
                  bottom:
                      14.0), // Align horizontally at the start, center vertically
              title: Text('Create Job Posting',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            backgroundColor: Colors.transparent,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInputCard(
                    title: 'Job Title',
                    hintText: 'Enter the job title',
                    icon: Icons.title,
                  ),
                  SizedBox(height: 20),
                  _buildInputCard(
                    title: 'Job Description',
                    hintText: 'Enter the job description',
                    icon: Icons.description,
                    maxLines: 5,
                  ),
                  SizedBox(height: 20),
                  _buildInputCard(
                    title: 'Required Skills',
                    hintText: 'Enter the skills required for this job',
                    icon: Icons.build,
                  ),
                  SizedBox(height: 20),
                  _buildInputCard(
                    title: 'Budget',
                    hintText: 'Enter the budget (e.g., \$500)',
                    icon: Icons.attach_money,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          _showSuccessDialog(context);
                        },
                        child: const Text("Create Job")),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Job Created'),
          content: Text('Your job has been created successfully.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Get.offAll(MainPage()); // Redirect to MainPage
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildInputCard({
    required String title,
    required String hintText,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
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
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              maxLines: maxLines,
              keyboardType: keyboardType,
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
}
