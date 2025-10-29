import 'package:flutter/material.dart';
import 'package:messaging_app/models/chat_message.dart';

class ChatThreadComponent extends StatelessWidget {
  final List<ChatMessage> chatMessages;

  const ChatThreadComponent({required this.chatMessages, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: chatMessages.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: chatMessages.reversed.toList()[index].isAiMessage!
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            Flexible(
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                color: Colors.grey.shade700,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Text(
                    chatMessages.reversed.toList()[index].message,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
