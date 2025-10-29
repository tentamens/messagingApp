import 'package:flutter/material.dart';
import 'package:messaging_app/models/chat_message.dart';
import 'package:messaging_app/screens/chat_screen/components/chat_text_field.dart';
import 'package:messaging_app/screens/chat_screen/components/chat_thread_component.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  final List<ChatMessage> _chatMessages = [
    ChatMessage(message: 'Hello', isAiMessage: true),
    ChatMessage(message: 'Good shooting today!', isAiMessage: true),
  ];

  void _sendMessage() {
    final text = _textController.text.trim();

    var newChatMessage = ChatMessage(message: text, isAiMessage: false);

    setState(() {
      _chatMessages.add(newChatMessage);
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButton(),
          Expanded(child: ChatThreadComponent(chatMessages: _chatMessages)),
          ChatTextField(textController: _textController, onSend: _sendMessage),
        ],
      ),
    );
  }
}
