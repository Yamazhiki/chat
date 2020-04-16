import 'dart:async';

import 'package:chat/model/event.dart';
import 'package:chat/model/message.dart';
import 'package:flutter/services.dart';

import 'model/conversation.dart';
import 'model/user.dart';

/// 野火SDK
class Chat {
  static Chat _instance;

  factory Chat() {
    if (_instance == null) {
      final MethodChannel _methodChannel =
          MethodChannel('io.newstyle.flutter.plugin.wildfirechat.chat/method');
      final EventChannel _eventChannel =
          EventChannel("io.newstyle.flutter.plugin.wildfirechat.chat/event");

      // ignore: close_sinks
      final StreamController _connectController = StreamController<IMEventConnect>();
      // ignore: close_sinks
      final StreamController _sendResultController = StreamController<IMEventSendResult>();
      // ignore: close_sinks
      final StreamController _receiveMessageController = StreamController<IMEventReceiveMessage>();
      // ignore: close_sinks
      final StreamController _reCallController = StreamController<IMEventReCall>();
      _eventChannel.receiveBroadcastStream().listen((value) {
        final v = Map<String, dynamic>.from(value);
        final event = IMEvent.fromJson(v);
        switch (event.type) {
          case 1: //Connecting Event
            _connectController.sink.add(IMEventConnect.fromJson(v));
            break;
          case 2:
            _sendResultController.sink.add(IMEventSendResult.fromJson(v));
            break;
          case 3:
            _receiveMessageController.sink.add(IMEventReceiveMessage.fromJson(v));
            break;
          case 4:
            _reCallController.sink.add(IMEventReCall.fromJson(v));
            break;
          default:
            break;
        }
      });
      _instance = Chat._(_methodChannel, _connectController, _sendResultController);
    }
    return _instance;
  }

  Chat._(this._methodChannel, this._connectController, this._sendResultController);

  final MethodChannel _methodChannel;
  final StreamController<IMEventConnect> _connectController;
  final StreamController<IMEventSendResult> _sendResultController;

  Stream<IMEventConnect> _connectStream;

  Stream<IMEventConnect> get connectStream {
    if (_connectStream == null) {
      _connectStream = _connectController.stream.asBroadcastStream();
    }
    return _connectStream;
  }

  Stream<IMEventSendResult> _sendResultStream;

  Stream<IMEventSendResult> get sendResultStream {
    if (_sendResultStream == null) {
      _sendResultStream = _sendResultController.stream.asBroadcastStream();
    }
    return _sendResultStream;
  }

  Future<String> getClientId() => _methodChannel.invokeMethod("getClientId");

  ///登录
  /// int 0 SDK受理了登录请求
  /// int 1 参数错误
  Future<int> connect(String userId, String token) {
    return _methodChannel
        .invokeMethod("connect", {"userId": userId, "token": token}).then((value) => value);
  }

  /// 设置IM服务器地址
  Future<void> setServerAddress(String endpoint) {
    return _methodChannel.invokeMethod("serverAddress", {"serverAddress": endpoint});
  }

  /// 断开IM连接
  Future<void> disconnect(bool clearSession) {
    return _methodChannel.invokeMethod("disconnect", {"clearSession": clearSession});
  }

  /// 获取IM服务器与本地的时间差
  Future<double> serverDeltaTime() {
    return _methodChannel.invokeMethod("serverDeltaTime").then((value) => value);
  }

  /// 获取用户信息
  Future<IMUser> getUserInfo(String userId, bool refresh) {
    return _methodChannel.invokeMapMethod<String, dynamic>("getUserInfo",
        {"userId": userId, "refresh": refresh}).then((value) => IMUser.fromJson(value));
  }

  /// 搜索用户
  /// keyword 搜索关键词
  /// searchType 搜索类型 0: 一般搜索(模糊搜索displayName ,精确搜索name和电话)，1:确匹配name和电话 2:精确匹配name 3:确匹配电话
  Future<IMSearchUser> searchUser(String keyword, {int searchType = 0, int page = 0}) {
    return _methodChannel.invokeMapMethod<String, dynamic>("searchUser", {
      "keyword": keyword,
      "searchType": searchType,
      "page": page
    }).then((value) => IMSearchUser.fromJson(value));
  }

  /*------------------------好友相关------------------------*/

  /// 搜索好友
  /// keyword 关键字
  Future<List<IMUser>> searchFriends(String keyword) {
    return _methodChannel.invokeListMethod("searchFriends", {"keyword": keyword}).then(
        (value) => value.map((e) => IMUser.fromJson(e)).toList());
  }

  /// 搜索好友
  /// userId 用户ID
  /// reason 理由
  Future<int> sendFriendRequest(String userId, {String reason = ""}) =>
      _methodChannel.invokeMethod<int>(
          "sendFriendRequest", {"userId": userId, "reason": reason}).then<int>((value) => value);

  /// 是否是好友
  /// userId 好友Id
  Future<bool> isMyFriend(String userId) {
    return _methodChannel.invokeMethod("isMyFriend", {"userId": userId});
  }

  /// 获取好友申请列表
  Future<List<IMFriendRequest>> get friendRequests => _methodChannel
      .invokeListMethod("getReceivedFriendRequests")
      .then((value) => value.map((e) => IMFriendRequest.fromJson(e)).toList());

  /// 处理好友请求
  /// userId 用户ID
  /// accept 是否接受
  /// extra 附加信息，如果接受，附加信息会添加到好友附加信息中
  Future<int> handleFriendRequest(String userId, bool isAccept, String extra) {
    return _methodChannel.invokeMethod(
        "handleFriendRequest", {"userId": userId, "accept": isAccept, "extra": extra});
  }

  ///设置黑名单
  /// userId 用户ID
  /// isBlackListed YES 加入黑名单； NO 取消黑名单
  Future<int> setBlackList(String userId, bool isBlackListed) => _methodChannel
      .invokeMethod("setBlackList", {"userId": userId, "isBlackListed": isBlackListed});

  /// 获取会话列表
  /// conversationTypes 0单人，1群聊 2聊天室 3频道
  /// lines [0]
  Future<List<IMConversationInfo>> getConversationInfos(
      {List<int> conversationTypes = const [0, 1, 2, 3], List<int> lines = const [0]}) {
    return _methodChannel.invokeListMethod<dynamic>("getConversationInfos", {
      "conversationTypes": conversationTypes,
      "lines": lines
    }).then((value) => value.map((e) => IMConversationInfo.fromJson(e)).toList());
  }

  Future<List<IMConversationSearchInfo>> searchConversation(String keyword,
      {List<int> inConversation = const [0, 1, 2, 3], List lines = const [0]}) {
    return _methodChannel.invokeListMethod<dynamic>("searchConversation", {
      "keyword": keyword,
      "inConversation": inConversation,
      "lines": lines
    }).then((value) => value.map((e) => IMConversationSearchInfo.fromJson(e)).toList());
  }

  ///删除会话
  Future<void> removeConversation(IMConversation conversation, {bool clearMessage = true}) {
    return _methodChannel.invokeMethod<void>("removeConversation",
        {"conversation": conversation.toJson(), "clearMessage": clearMessage});
  }

  ///设置会话草稿
  Future<int> setDraftConversation(IMConversation conversation, String draft) {
    return _methodChannel.invokeMethod<int>(
        "setDraftConversation", {"conversation": conversation.toJson(), "draft": draft});
  }

  // 会话置顶
  Future<int> setTopConversation(IMConversation conversation, bool isTop) {
    return _methodChannel.invokeMethod<int>(
        "setTopConversation", {"conversation": conversation.toJson(), "isTop": isTop});
  }

  // 会话草稿
  Future<int> setSilentConversation(IMConversation conversation, bool isDraft) {
    return _methodChannel.invokeMethod<int>(
        "setSilentConversation", {"conversation": conversation.toJson(), "isSilent": isDraft});
  }

  /// 发送消息
  Future<IMMessage> sendMessage(IMConversation conversation, int type, dynamic content,
      {List<String> toUser = const [], int expireDuration = 0}) {
    return _methodChannel.invokeMethod("sendMessge", {
      "conversation": conversation.toJson(),
      "type": type,
      "content": content,
      "toUsers": toUser,
      "expireDuration": expireDuration
    });
  }

  /// 搜索消息
  Future<List<IMMessage>> searchMessage(IMConversation conversation, String keyword) {
    return _methodChannel.invokeListMethod("searchMessage", {
      "conversation": conversation.toJson(),
      "keyword": keyword
    }).then((value) => value.map((e) => IMMessage.fromJson(e)).toList());
  }
}
