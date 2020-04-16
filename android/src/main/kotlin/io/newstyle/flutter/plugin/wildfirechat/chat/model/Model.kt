package io.newstyle.flutter.plugin.ext

import cn.wildfirechat.model.FriendRequest
import cn.wildfirechat.model.UserInfo

fun FriendRequest.toMap():Map<String,Any> {
    return mapOf(
            "direction" to direction,
            "target" to target,
            "reason" to reason,
            "status" to status,
            "readStatus" to readStatus,
            "timestamp" to timestamp
    )
}

fun UserInfo.toMap():Map<String,Any> {
    return mapOf (
            "uid" to uid,
            "name" to name,
            "displayName" to displayName,
            "groupAlias" to groupAlias,
            "friendAlias" to friendAlias,
            "portrait" to portrait,
            "gender" to gender,
            "mobile" to mobile,
            "email" to email,
            "address" to address,
            "company" to company,
            "social" to social,
            "extra" to extra,
            "updateDt" to updateDt,
            "type" to type,
            "deleted" to deleted
    )
}

