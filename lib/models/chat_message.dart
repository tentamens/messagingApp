class ChatMessage {
  final String message;
  final bool? isAiMessage;

  ChatMessage({required this.message, this.isAiMessage});

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      message: map['message'] as String,
      isAiMessage: map['isSystemMessage'] as bool?,
    );
  }
}
