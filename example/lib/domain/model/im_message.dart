import 'package:chat_example/domain/model/im_user.dart';

enum ChatMessageKind { Text, Image, Voice, Video }

class ChatMessage {
  final IMUser from;
  final bool isSend;
  final ChatMessageKind kind;
  final String content;

  ChatMessage({this.from, this.isSend, this.kind, this.content});
}

class ChatTextMessage extends ChatMessage {
  final String text;

  ChatTextMessage({this.text});
}

class ChatImageMessage extends ChatMessage {}
