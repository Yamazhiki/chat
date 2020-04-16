// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unread.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IMUnreadCount _$IMUnreadCountFromJson(Map<String, dynamic> json) {
  return IMUnreadCount(
    unread: json['unread'] as int,
    unreadMention: json['unreadMention'] as int,
    unreadMentionAll: json['unreadMentionAll'] as int,
  );
}

Map<String, dynamic> _$IMUnreadCountToJson(IMUnreadCount instance) =>
    <String, dynamic>{
      'unread': instance.unread,
      'unreadMention': instance.unreadMention,
      'unreadMentionAll': instance.unreadMentionAll,
    };
