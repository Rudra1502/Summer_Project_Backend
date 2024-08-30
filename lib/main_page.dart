import 'package:flutter/material.dart';
import 'package:summer_project/chat._list.dart';
import 'package:summer_project/hire.dart'; // Ensure this is the correct path to your CreateJobPage
import 'package:summer_project/profile_page.dart';
import 'package:summer_project/search_page.dart';
import 'package:summer_project/settings.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Use the build context to initialize the pages properly
  List<Widget> _pages(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Jobs",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: _buildListView(),
            ),
          ],
        ),
      ),
      CreateJobPage(), // The Create Job Page (Hiring Page)
      ChatListPage(), // Placeholder for Messages Page
      SettingsPage(), // Profile Page
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JobVerse",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages(context), // Pass context to _pages function
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Colors.transparent, // Background color of the navigation bar
        selectedItemColor: Colors.teal, // Color of the selected item
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex, // Track the current index
        onTap: _onItemTapped, // Handle taps on the navigation items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: "Jobs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: "Hire",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    // return ListView.builder(
    //   itemCount: 6,
    //   itemBuilder: (context, index) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text(
                "Web Developer Needed for E-commerce Platform",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Description: Looking for an experienced web developer to build a responsive e-commerce platform. Must have expertise in React, Node.js, and MongoDB."),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text("Apply"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text(
                "Graphic Designer for Logo and Branding",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Description: We need a creative graphic designer to create a logo and branding materials for a new startup. Experience in Adobe Illustrator and Photoshop is required."),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text("Apply"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text(
                "Content Writer for Blog Posts",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Description: Looking for a content writer to create engaging blog posts on various topics. Must have excellent writing skills and experience in SEO."),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text("Apply"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          // Card(
          //   elevation: 4,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          //   child: ListTile(
          //     title: Text("Web Developer Needed for E-commerce Platform"),
          //     subtitle: Text("Description: Looking for an experienced web developer to build a responsive e-commerce platform. Must have expertise in React, Node.js, and MongoDB."),
          //     trailing: ElevatedButton(
          //       onPressed: () {},
          //       child: Text("Apply"),
          //       style: ElevatedButton.styleFrom(
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
    //   },
    // );
  }
}
