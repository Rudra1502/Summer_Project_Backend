import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatDetailPage extends StatefulWidget {
  final String chatName;
  final String initialMessage;
  final ValueChanged<String> onMessageSent;

  const ChatDetailPage({
    required this.chatName,
    required this.initialMessage,
    required this.onMessageSent,
  });

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialMessage.isNotEmpty) {
      _messages.add({
        'text': widget.initialMessage,
        'isMe': false,
        'timestamp': DateTime.now(),
      });
    }
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _controller.text,
          'isMe': true,
          'timestamp': DateTime.now(),
        });
        widget.onMessageSent(_controller.text);
        // Simulate receiving a response for demonstration
        _messages.add({
          'text': 'Reply to: ${_controller.text}',
          'isMe': false,
          'timestamp': DateTime.now(),
        });
      });
      _controller.clear();
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('h:mm a')
        .format(timestamp); // Format as hour:minute AM/PM
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatName,style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return Align(
                  alignment: message['isMe']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: message['isMe'] ? Colors.teal : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: message['isMe']
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['text'],
                          style: TextStyle(
                            color:
                                message['isMe'] ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          _formatTimestamp(message['timestamp']),
                          style: TextStyle(
                            fontSize: 10,
                            color: message['isMe']
                                ? Colors.white70
                                : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.teal),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
