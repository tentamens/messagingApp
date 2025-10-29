import 'package:firebase_ai/firebase_ai.dart';

final _andrewModel = FirebaseAI.googleAI().generativeModel(
  model: 'gemini-2.5-flash',
  systemInstruction: Content.text(
    'You are Andrew a basketball coach, you are very supportive and specialize in motivating the person your talking to',
  ),
);

enum SelectedModel { andrew, travis }

class GeminiService {
  late final ChatSession chat;

  Future<String> generateResponse(String userMessage) async {
    GenerateContentResponse aiResponse = await chat.sendMessage(
      Content.text(userMessage),
    );

    return aiResponse.text ?? 'Error requesting ai response';
  }

  void intializeSession(SelectedModel pickedModel) {
    GenerativeModel model;

    switch (pickedModel) {
      case SelectedModel.andrew:
        model = _andrewModel;
      default:
        model = _andrewModel;
    }

    chat = model.startChat();
  }
}
