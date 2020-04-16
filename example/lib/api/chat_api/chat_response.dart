import 'package:json_annotation/json_annotation.dart';

part 'chat_response.g.dart';

@JsonSerializable()
class ChatResponse<T> {
  final int code;
  final String message;
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final T result;

  bool get isOK => code == 0;

  ChatResponse({this.code, this.message, this.result});

  factory ChatResponse.fromJson(Map<String, dynamic> json) => _$ChatResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}

T _dataFromJson<T>(Map<String, dynamic> input) {
  if (T == Login) {
    return Login.fromJson(input) as T;
  }
  return null;
}

Map<String, dynamic> _dataToJson<T, S, U>(T input, [S other1, U other2]) => {'result': input};

@JsonSerializable()
class Login {
  final String userId;
  final String token;
  final bool register;

  Login({this.userId, this.token, this.register});

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
