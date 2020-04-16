// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IMEvent _$IMEventFromJson(Map<String, dynamic> json) {
  return IMEvent(
    type: json['type'] as int,
  );
}

Map<String, dynamic> _$IMEventToJson(IMEvent instance) => <String, dynamic>{
      'type': instance.type,
    };

IMEventConnect _$IMEventConnectFromJson(Map<String, dynamic> json) {
  return IMEventConnect(
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$IMEventConnectToJson(IMEventConnect instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

IMEventSendResult _$IMEventSendResultFromJson(Map<String, dynamic> json) {
  return IMEventSendResult(
    status: json['status'] as int,
    message: json['message'] == null
        ? null
        : IMMessage.fromJson(json['message'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IMEventSendResultToJson(IMEventSendResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

IMEventReceiveMessage _$IMEventReceiveMessageFromJson(
    Map<String, dynamic> json) {
  return IMEventReceiveMessage(
    messages: (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : IMMessage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$IMEventReceiveMessageToJson(
        IMEventReceiveMessage instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };

IMEventReCall _$IMEventReCallFromJson(Map<String, dynamic> json) {
  return IMEventReCall(
    message: json['message'] == null
        ? null
        : IMMessage.fromJson(json['message'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IMEventReCallToJson(IMEventReCall instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
