import 'package:flutter/material.dart';
import 'package:messaging_app/providers/chat_content_provider.dart';
import 'package:provider/provider.dart';

class ChatTextField extends StatelessWidget {
  ChatTextField({super.key});

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatContentProvider = Provider.of<ChatContentProvider>(context);

    return Container(
      color: Colors.grey.shade800,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: TextField(
                controller: _textController,
                style: TextStyle(color: Colors.white),
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Enter Message',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton.filled(
              onPressed: () =>
                  chatContentProvider.sendMessage(_textController.text),
              icon: Icon(Icons.send_rounded),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  Colors.blue.shade700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
