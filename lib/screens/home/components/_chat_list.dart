import 'package:flutter/material.dart';
import 'package:messaging_app/screens/chat_screen/chat_screen.dart';

class ChatLists extends StatelessWidget {
  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Travis Pep talks',
      'logo': Icons.sports_basketball,
      'lastMessageContent': 'Keep up the practice bro!',
    },
    {
      'name': 'Andrew Stats Improvements',
      'logo': Icons.sports_basketball_outlined,
      'lastMessageContent': 'Your shooting is up 30% keep it up!',
    },
  ];

  ChatLists({super.key});

  void navigateToChat(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> chatLists = chats.map((chat) {
      return Container(
        margin: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white10, width: 1.5)),
          gradient: LinearGradient(
            end: Alignment.topLeft,
            begin: Alignment.bottomRight,
            colors: [Colors.orangeAccent, Colors.orange],
          ),
          borderRadius: BorderRadius.circular(10),
        ),

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: () => {navigateToChat(context)},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
            child: Row(
              spacing: 15,
              children: [
                Icon(chat['logo'] as IconData, size: 30, color: Colors.white),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat['name'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      chat['lastMessageContent'],
                      style: TextStyle(
                        color: Colors.grey.shade200,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();

    return ListView(children: chatLists);
  }
}
