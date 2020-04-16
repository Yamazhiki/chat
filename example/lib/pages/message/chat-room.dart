import 'package:chat_example/domain/model/im_message.dart';
import 'package:chat_example/domain/model/im_user.dart';
import 'package:flutter/material.dart';

import 'chat-room/chat_room_input_bar.dart';
import 'chat-room/chat_room_msg_text.dart';

class ChatRoomPage extends StatelessWidget {
  final messages = [
    ChatMessage(
        from: IMUser.create(0),
        kind: ChatMessageKind.Text,
        content: "Flutter 是基于Dart这个语言的。在Dart 2.7 版本中，新加入了一个重要的语法功能，叫做extension",
        isSend: true),
    ChatMessage(
        from: IMUser.create(1),
        kind: ChatMessageKind.Text,
        content: "Extension的主要功能给已经存在的类添加新的member function，往里面增加新的函数",
        isSend: false),
    ChatMessage(
        from: IMUser.create(0), kind: ChatMessageKind.Text, content: "原来Dart这么厉害呀", isSend: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.white),
      child: Scaffold(
        backgroundColor: Color(0xFFEDEDED),
        appBar: AppBar(
          elevation: 0,
          title: Text("南风不竞"),
        ),
        body: Container(
          child: ListView.builder(
            itemBuilder: (_, idx) {
              switch (messages[idx].kind) {
                default:
                  return ChatRoomMessageText(
                    msg: messages[idx],
                  );
              }
            },
            itemCount: messages.length,
          ),
        ),
        bottomNavigationBar: ChatRoomInputBar(),
      ),
    );
  }
}
