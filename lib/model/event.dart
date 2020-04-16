import 'package:chat/model/message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class IMEvent {
  final int type;

  IMEvent({this.type});

  factory IMEvent.fromJson(Map<String, dynamic> json) => _$IMEventFromJson(json);

  Map<String, dynamic> toJson() => _$IMEventToJson(this);
}

@JsonSerializable()
class IMEventConnect extends IMEvent {
  final int status;

  IMEventConnect({this.status}) : super(type: 1);

  factory IMEventConnect.fromJson(Map<String, dynamic> json) => _$IMEventConnectFromJson(json);

  Map<String, dynamic> toJson() => _$IMEventConnectToJson(this);
}

@JsonSerializable()
class IMEventSendResult extends IMEvent {
  final int status;
  final IMMessage message;

  IMEventSendResult({this.status, this.message}) : super(type: 2);

  factory IMEventSendResult.fromJson(Map<String, dynamic> json) =>
      _$IMEventSendResultFromJson(json);

  Map<String, dynamic> toJson() => _$IMEventSendResultToJson(this);
}

@JsonSerializable()
class IMEventReceiveMessage extends IMEvent {
  final List<IMMessage> messages;

  IMEventReceiveMessage({this.messages}) : super(type: 3);

  factory IMEventReceiveMessage.fromJson(Map<String, dynamic> json) =>
      _$IMEventReceiveMessageFromJson(json);

  Map<String, dynamic> toJson() => _$IMEventReceiveMessageToJson(this);
}

@JsonSerializable()
class IMEventReCall extends IMEvent {
  final IMMessage message;

  IMEventReCall({this.message}) : super(type: 4);

  factory IMEventReCall.fromJson(Map<String, dynamic> json) => _$IMEventReCallFromJson(json);

  Map<String, dynamic> toJson() => _$IMEventReCallToJson(this);
}
