import 'package:flutter/material.dart';
import 'package:messaging_app/models/chat_message.dart';
import 'package:messaging_app/providers/chat_content_provider.dart';
import 'package:messaging_app/screens/chat_screen/components/chat_text_field.dart';
import 'package:messaging_app/screens/chat_screen/components/chat_thread_component.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final chatContentProvider = Provider.of<ChatContentProvider>(
      context,
      listen: true,
    );

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButton(),
          Expanded(
            child: ChatThreadComponent(
              chatMessages: chatContentProvider.chatMessages,
            ),
          ),
          ChatTextField(),
        ],
      ),
    );
  }
}
