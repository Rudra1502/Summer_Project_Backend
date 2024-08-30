import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:summer_project/chat_details.dart';

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final List<Map<String, dynamic>> chats = [
    {
      'name': 'John Doe',
      'lastMessage': '',
      'lastMessageTime': DateTime.now().subtract(Duration(hours: 1))
    },
    {
      'name': 'Jane Smith',
      'lastMessage': '',
      'lastMessageTime': DateTime.now().subtract(Duration(hours: 2))
    },
    {
      'name': 'David Lee',
      'lastMessage': '',
      'lastMessageTime': DateTime.now().subtract(Duration(hours: 3))
    },
  ];

  void _updateLastMessage(int index, String message) {
    setState(() {
      chats[index]['lastMessage'] = message;
      chats[index]['lastMessageTime'] = DateTime.now();
    });
  }

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('h:mm a')
        .format(timestamp); // Format as hour:minute AM/PM
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            pinned: false, // AppBar will disappear when scrolling up
            expandedHeight: kToolbarHeight, // Standard AppBar height
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(
                  left: 16.0,
                  bottom:
                      14.0), // Align horizontally at the start, center vertically
              title: Text('Chats',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            backgroundColor: Colors.transparent,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                        chat['name'][0]), // Display first letter of the name
                  ),
                  title: Text(chat['name']),
                  subtitle: Text(
                    chat['lastMessage'].isNotEmpty
                        ? chat['lastMessage']
                        : 'No messages yet...',
                    overflow: TextOverflow.ellipsis, // Display partially
                  ),
                  trailing: Text(_formatTimestamp(chat['lastMessageTime'])),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailPage(
                          chatName: chat['name'],
                          initialMessage: chat['lastMessage'],
                          onMessageSent: (lastMessage) {
                            _updateLastMessage(index, lastMessage);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              childCount: chats.length,
            ),
          ),
        ],
      ),
    );
  }
}
