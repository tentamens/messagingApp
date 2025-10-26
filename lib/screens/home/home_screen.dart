import 'package:flutter/material.dart';
import 'package:messaging_app/screens/home/components/_chat_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: const Text('Hello world', style: TextStyle(color: Colors.white)),
      ),
      body: Column(children: [Expanded(child: ChatLists())]),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        label: const Text(
          'Start New Chat',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        onPressed: () => {print('hello world')},
      ),
    );
  }
}
