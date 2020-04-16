import 'package:chat/model/conversation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class IMTextMessage {
  final String text;

  /// 提醒类型，1，提醒部分对象（mentinedTarget）。2，提醒全部。其他不提醒
  final int mentionedType;

  /// 提醒对象，mentionedType 1时有效
  final List<String> mentionedTargets;

  IMTextMessage({this.text, this.mentionedType, this.mentionedTargets});

  factory IMTextMessage.fromJson(Map<String, dynamic> json) => _$IMTextMessageFromJson(json);

  Map<String, dynamic> toJson() => _$IMTextMessageToJson(this);
}

@JsonSerializable()
class IMStickerMessage {
  final String localPath;
  final String remoteUrl;
  final int width;
  final int height;

  IMStickerMessage({this.localPath, this.remoteUrl, this.width, this.height});

  factory IMStickerMessage.fromJson(Map<String, dynamic> json) => _$IMStickerMessageFromJson(json);

  Map<String, dynamic> toJson() => _$IMStickerMessageToJson(this);
}

@JsonSerializable()
class IMSoundMessage {
  final String localPath;
  final String remoteUrl;
  final int duration;

  IMSoundMessage({this.localPath, this.remoteUrl, this.duration});

  factory IMSoundMessage.fromJson(Map<String, dynamic> json) => _$IMSoundMessageFromJson(json);

  Map<String, dynamic> toJson() => _$IMSoundMessageToJson(this);
}

@JsonSerializable()
class IMMessage {
  final int messageId;
  final int messageUid;
  final IMConversation conversation;
  final String fromUser;
  final List<String> toUsers;
  final dynamic content;
  final int contentType;

  /// 0:发送，1:接收
  final int direction;

  /// 0发送中,1发送成功,2发送失败,3未读,4已读,5已播放(媒体消息)
  final int status;
  final int serverTime;

  IMMessage(
      {this.messageId,
      this.messageUid,
      this.conversation,
      this.fromUser,
      this.toUsers,
      this.content,
      this.contentType,
      this.direction,
      this.status,
      this.serverTime});

  factory IMMessage.fromJson(Map<String, dynamic> json) => _$IMMessageFromJson(json);

  Map<String, dynamic> toJson() => _$IMMessageToJson(this);
}

@JsonSerializable()
class IMMessageSendResult {
  final IMMessage message;
  final int status;

  IMMessageSendResult({this.message, this.status});

  factory IMMessageSendResult.fromJson(Map<String, dynamic> json) =>
      _$IMMessageSendResultFromJson(json);

  Map<String, dynamic> toJson() => _$IMMessageSendResultToJson(this);
}

@JsonSerializable()
class IMFriendRequest {
  final int direction;
  final String target;
  final String reason;
  final int status;
  final int readStatus;
  final int timestamp;

  IMFriendRequest(
      {this.direction, this.target, this.reason, this.status, this.readStatus, this.timestamp});

  factory IMFriendRequest.fromJson(Map<String, dynamic> json) => _$IMFriendRequestFromJson(json);

  Map<String, dynamic> toJson() => _$IMFriendRequestToJson(this);
}
