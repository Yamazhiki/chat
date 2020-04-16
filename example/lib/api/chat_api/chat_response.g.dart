// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResponse<T> _$ChatResponseFromJson<T>(Map<String, dynamic> json) {
  return ChatResponse<T>(
    code: json['code'] as int,
    message: json['message'] as String,
    result: _dataFromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChatResponseToJson<T>(ChatResponse<T> instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'result': _dataToJson(instance.result),
    };

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    userId: json['userId'] as String,
    token: json['token'] as String,
    register: json['register'] as bool,
  );
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'userId': instance.userId,
      'token': instance.token,
      'register': instance.register,
    };
