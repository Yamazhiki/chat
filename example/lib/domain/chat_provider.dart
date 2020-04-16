import 'package:chat/chat.dart';
import 'package:chat_example/api/chat_api/chat_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:imei_plugin/imei_plugin.dart';

class ChatProvider extends ChangeNotifier {
  static String ChatUserIDKey = "chat_userId";
  static String ChatUserTokenKey = "chat_token";

  Chat get manager => Chat();
  ChatApi _api = ChatApi(Dio());

  ChatProvider() {
    //manager.setServerAddress("152.136.93.14:1883");
    _autoLogin();
  }

  void _autoLogin() async {
    login("13121218001", "66666");
  }

  /// 登录，成功之后保存用户ID和Token
  login(String loginName, String code) async {
    if (loginName == null || code == null) {
      return;
    }

    var clientId = await ImeiPlugin.getImei();
    print(clientId);

    var login = await _api.login(
        {"mobile": loginName, "code": code, "clientId": clientId, "platform": 1}).catchError((e) {
      print(e);
    });
    print(login.result.toJson());
    if (login.code == 0) {
      _connect(login.result.userId, login.result.token);
    }
  }

  _connect(String userId, String token) {
    manager.connect(userId, token);
  }
}
