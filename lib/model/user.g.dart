// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IMUser _$IMUserFromJson(Map<String, dynamic> json) {
  return IMUser(
    userId: json['userId'] as String,
    name: json['name'] as String,
    displayName: json['displayName'] as String,
    gender: json['gender'] as int,
    portrait: json['portrait'] as String,
    mobile: json['mobile'] as String,
    email: json['email'] as String,
    address: json['address'] as String,
    company: json['company'] as String,
    social: json['social'] as String,
    extra: json['extra'] as String,
    friendAlias: json['friendAlias'] as String,
    groupAlias: json['groupAlias'] as String,
    updateDt: json['updateDt'] as int,
    type: json['type'] as int,
    deleted: json['deleted'] as int,
  );
}

Map<String, dynamic> _$IMUserToJson(IMUser instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'displayName': instance.displayName,
      'gender': instance.gender,
      'portrait': instance.portrait,
      'mobile': instance.mobile,
      'email': instance.email,
      'address': instance.address,
      'company': instance.company,
      'social': instance.social,
      'extra': instance.extra,
      'friendAlias': instance.friendAlias,
      'groupAlias': instance.groupAlias,
      'updateDt': instance.updateDt,
      'type': instance.type,
      'deleted': instance.deleted,
    };

IMSearchUser _$IMSearchUserFromJson(Map<String, dynamic> json) {
  return IMSearchUser(
    users: (json['users'] as List)
        ?.map((e) =>
            e == null ? null : IMUser.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    code: json['code'] as int,
  );
}

Map<String, dynamic> _$IMSearchUserToJson(IMSearchUser instance) =>
    <String, dynamic>{
      'users': instance.users,
      'code': instance.code,
    };
