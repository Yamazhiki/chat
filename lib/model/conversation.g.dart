// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IMConversation _$IMConversationFromJson(Map<String, dynamic> json) {
  return IMConversation(
    type: json['type'] as int,
    target: json['target'] as String,
    line: json['line'] as int,
  );
}

Map<String, dynamic> _$IMConversationToJson(IMConversation instance) =>
    <String, dynamic>{
      'type': instance.type,
      'target': instance.target,
      'line': instance.line,
    };

IMConversationInfo _$IMConversationInfoFromJson(Map<String, dynamic> json) {
  return IMConversationInfo(
    conversation: json['conversation'] == null
        ? null
        : IMConversation.fromJson(json['conversation'] as Map<String, dynamic>),
    lastMessage: json['lastMessage'] == null
        ? null
        : IMMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
    draft: json['draft'] as String,
    timestamp: json['timestamp'] as int,
    unread: json['unreadCount'] == null
        ? null
        : IMUnreadCount.fromJson(json['unreadCount'] as Map<String, dynamic>),
    isTop: json['isTop'] as bool,
    isSilent: json['isSilent'] as bool,
  );
}

Map<String, dynamic> _$IMConversationInfoToJson(IMConversationInfo instance) =>
    <String, dynamic>{
      'conversation': instance.conversation,
      'lastMessage': instance.lastMessage,
      'draft': instance.draft,
      'timestamp': instance.timestamp,
      'unreadCount': instance.unread,
      'isTop': instance.isTop,
      'isSilent': instance.isSilent,
    };

IMConversationSearchInfo _$IMConversationSearchInfoFromJson(
    Map<String, dynamic> json) {
  return IMConversationSearchInfo(
    conversation: json['conversation'] == null
        ? null
        : IMConversation.fromJson(json['conversation'] as Map<String, dynamic>),
    message: json['message'] == null
        ? null
        : IMMessage.fromJson(json['message'] as Map<String, dynamic>),
    count: json['count'] as int,
    keyword: json['keyword'] as String,
  );
}

Map<String, dynamic> _$IMConversationSearchInfoToJson(
        IMConversationSearchInfo instance) =>
    <String, dynamic>{
      'conversation': instance.conversation,
      'message': instance.message,
      'count': instance.count,
      'keyword': instance.keyword,
    };
