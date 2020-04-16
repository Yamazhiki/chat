import 'package:json_annotation/json_annotation.dart';

part 'unread.g.dart';

@JsonSerializable()
class IMUnreadCount {
  final int unread;
  final int unreadMention;
  final int unreadMentionAll;

  IMUnreadCount({this.unread, this.unreadMention, this.unreadMentionAll});

  factory IMUnreadCount.fromJson(Map<String, dynamic> json) => _$IMUnreadCountFromJson(json);

  Map<String, dynamic> toJson() => _$IMUnreadCountToJson(this);
}
