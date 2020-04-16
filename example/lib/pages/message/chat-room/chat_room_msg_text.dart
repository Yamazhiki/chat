import 'package:chat_example/domain/model/im_message.dart';
import 'package:chat_example/widgets/clip_x_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constracts.dart';

class ChatRoomMessageText extends StatelessWidget {
  final ChatMessage msg;

  ChatRoomMessageText({this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ChatRoomMessagePadding),
      child: Row(
        mainAxisAlignment: msg.isSend ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: msg.isSend
            ? [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: _content(context, msg.isSend),
                ),
                ClipXNetworkImage(url: msg.from.avatar, size: 40)
              ]
            : [
                ClipXNetworkImage(url: msg.from.avatar, size: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: _content(context, msg.isSend),
                )
              ],
      ),
    );
  }

  Widget _content(BuildContext context, bool isSend) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * ChatRoomMessageMaxWidthFactor),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSend ? ChatRoomMessageSendBubbleColor : ChatRoomMessageRecvBubbleColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          msg.content,
          style: TextStyle(
              color: isSend ? ChatRoomMessageSendTextColor : ChatRoomMessageRecvTextColor),
        ),
      ),
    );
  }
}
