// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IMTextMessage _$IMTextMessageFromJson(Map<String, dynamic> json) {
  return IMTextMessage(
    text: json['text'] as String,
    mentionedType: json['mentionedType'] as int,
    mentionedTargets:
        (json['mentionedTargets'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$IMTextMessageToJson(IMTextMessage instance) =>
    <String, dynamic>{
      'text': instance.text,
      'mentionedType': instance.mentionedType,
      'mentionedTargets': instance.mentionedTargets,
    };

IMStickerMessage _$IMStickerMessageFromJson(Map<String, dynamic> json) {
  return IMStickerMessage(
    localPath: json['localPath'] as String,
    remoteUrl: json['remoteUrl'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$IMStickerMessageToJson(IMStickerMessage instance) =>
    <String, dynamic>{
      'localPath': instance.localPath,
      'remoteUrl': instance.remoteUrl,
      'width': instance.width,
      'height': instance.height,
    };

IMSoundMessage _$IMSoundMessageFromJson(Map<String, dynamic> json) {
  return IMSoundMessage(
    localPath: json['localPath'] as String,
    remoteUrl: json['remoteUrl'] as String,
    duration: json['duration'] as int,
  );
}

Map<String, dynamic> _$IMSoundMessageToJson(IMSoundMessage instance) =>
    <String, dynamic>{
      'localPath': instance.localPath,
      'remoteUrl': instance.remoteUrl,
      'duration': instance.duration,
    };

IMMessage _$IMMessageFromJson(Map<String, dynamic> json) {
  return IMMessage(
    messageId: json['messageId'] as int,
    messageUid: json['messageUid'] as int,
    conversation: json['conversation'] == null
        ? null
        : IMConversation.fromJson(json['conversation'] as Map<String, dynamic>),
    fromUser: json['fromUser'] as String,
    toUsers: (json['toUsers'] as List)?.map((e) => e as String)?.toList(),
    content: json['content'],
    contentType: json['contentType'] as int,
    direction: json['direction'] as int,
    status: json['status'] as int,
    serverTime: json['serverTime'] as int,
  );
}

Map<String, dynamic> _$IMMessageToJson(IMMessage instance) => <String, dynamic>{
      'messageId': instance.messageId,
      'messageUid': instance.messageUid,
      'conversation': instance.conversation,
      'fromUser': instance.fromUser,
      'toUsers': instance.toUsers,
      'content': instance.content,
      'contentType': instance.contentType,
      'direction': instance.direction,
      'status': instance.status,
      'serverTime': instance.serverTime,
    };

IMMessageSendResult _$IMMessageSendResultFromJson(Map<String, dynamic> json) {
  return IMMessageSendResult(
    message: json['message'] == null
        ? null
        : IMMessage.fromJson(json['message'] as Map<String, dynamic>),
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$IMMessageSendResultToJson(
        IMMessageSendResult instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };

IMFriendRequest _$IMFriendRequestFromJson(Map<String, dynamic> json) {
  return IMFriendRequest(
    direction: json['direction'] as int,
    target: json['target'] as String,
    reason: json['reason'] as String,
    status: json['status'] as int,
    readStatus: json['readStatus'] as int,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$IMFriendRequestToJson(IMFriendRequest instance) =>
    <String, dynamic>{
      'direction': instance.direction,
      'target': instance.target,
      'reason': instance.reason,
      'status': instance.status,
      'readStatus': instance.readStatus,
      'timestamp': instance.timestamp,
    };
