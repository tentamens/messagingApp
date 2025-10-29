import 'package:flutter/material.dart';
import 'package:messaging_app/models/chat_message.dart';
import 'package:messaging_app/services/gemini_service.dart';

class ChatContentProvider extends ChangeNotifier {
  List<ChatMessage> chatMessages = [];
  bool isLoading = false;
  GeminiService geminiService = GeminiService();
  bool temp = false;

  Future<void> sendMessage(String message) async {
    if (!temp) {
      geminiService.setup();
      temp = true;
    }
    chatMessages.add(ChatMessage(message: message, isAiMessage: false));
    isLoading = true;
    notifyListeners();

    final aiResponse = await geminiService.generateResponse(message);

    chatMessages.add(ChatMessage(message: aiResponse, isAiMessage: false));
    isLoading = false;
    notifyListeners();
  }
}
