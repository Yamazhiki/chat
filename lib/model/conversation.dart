import 'package:chat/model/message.dart';
import 'package:chat/model/unread.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation.g.dart';

@JsonSerializable()
class IMConversation {
  final int type;
  final String target;
  final int line;

  IMConversation({this.type = 0, @required this.target, this.line = 0});

  factory IMConversation.fromJson(Map<String, dynamic> json) => _$IMConversationFromJson(json);

  Map<String, dynamic> toJson() => _$IMConversationToJson(this);
}

@JsonSerializable()
class IMConversationInfo {
  final IMConversation conversation;
  final IMMessage lastMessage;
  final String draft;
  final int timestamp;
  @JsonKey(name: "unreadCount")
  final IMUnreadCount unread;
  final bool isTop;
  final bool isSilent;

  IMConversationInfo(
      {this.conversation,
      this.lastMessage,
      this.draft,
      this.timestamp,
      this.unread,
      this.isTop,
      this.isSilent});

  factory IMConversationInfo.fromJson(Map<String, dynamic> json) =>
      _$IMConversationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$IMConversationInfoToJson(this);
}

@JsonSerializable()
class IMConversationSearchInfo {
  final IMConversation conversation;
  final IMMessage message;
  final int count;
  final String keyword;

  IMConversationSearchInfo({this.conversation, this.message, this.count, this.keyword});

  factory IMConversationSearchInfo.fromJson(Map<String, dynamic> json) =>
      _$IMConversationSearchInfoFromJson(json);

  Map<String, dynamic> toJson() => _$IMConversationSearchInfoToJson(this);
}
