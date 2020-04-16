import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class IMUser {
  /// 用户ID
  final String userId;

  /// 名称
  final String name;

  /// 显示的名称
  final String displayName;

  /// 性别
  final int gender;

  /// 头像
  final String portrait;

  /// 手机号
  final String mobile;

  /// 邮箱
  final String email;

  /// 地址
  final String address;

  /// 公司信息
  final String company;

  /// 社交信息
  final String social;

  /// 扩展信息
  final String extra;

  /// 好友备注
  final String friendAlias;

  /// 群昵称
  final String groupAlias;

  /// 更新时间
  final int updateDt;

  /// 用户类型
  final int type;

  /// 是否被删除用户
  final int deleted;

  IMUser(
      {this.userId,
      this.name,
      this.displayName,
      this.gender,
      this.portrait,
      this.mobile,
      this.email,
      this.address,
      this.company,
      this.social,
      this.extra,
      this.friendAlias,
      this.groupAlias,
      this.updateDt,
      this.type,
      this.deleted});

  factory IMUser.fromJson(Map<String, dynamic> json) => _$IMUserFromJson(json);

  Map<String, dynamic> toJson() => _$IMUserToJson(this);
}

@JsonSerializable()
class IMSearchUser {
  final List<IMUser> users;
  final int code;
  IMSearchUser({this.users, this.code});
  factory IMSearchUser.fromJson(Map<String, dynamic> json) => _$IMSearchUserFromJson(json);
  Map<String, dynamic> toJson() => _$IMSearchUserToJson(this);
}
