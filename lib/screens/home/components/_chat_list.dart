import 'package:flutter/material.dart';

class ChatLists extends StatelessWidget {
  final List<Map<String, dynamic>> chats = [
    {'name': 'Fag'},
  ];

  ChatLists({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> chatLists = chats.map((chat) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(chat['name']),
      );
    }).toList();

    return ListView(children: chatLists);
  }
}
