import 'package:flutter/material.dart';
import 'package:messaging_app/models/chat_message.dart';

class ChatContentProvider extends ChangeNotifier {
  List<ChatMessage> _chatMessages = [];
  bool _isLoading = false;

  Future<void> sendMessage(String message) async {
    _chatMessages.add(ChatMessage(message: message, isAiMessage: false));
    _isLoading = true;
    notifyListeners();
  }
}
