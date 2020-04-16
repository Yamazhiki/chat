import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'chat_response.dart';

part 'chat_api.g.dart';

@RestApi(baseUrl: "http://123.206.20.239:8888")
abstract class ChatApi {
  factory ChatApi(Dio dio, {String baseUrl}) = _ChatApi;

  @POST("/login")
  Future<ChatResponse<Login>> login(@Body() Map<String, dynamic> map);
}
