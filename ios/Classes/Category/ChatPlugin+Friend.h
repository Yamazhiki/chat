//
// Created by 王斌 on 2020/4/7.
//

#import <Foundation/Foundation.h>
#import "ChatPlugin.h"

/*
 * 好友相关
 */
@interface ChatPlugin (Friend)
/**
 * 是否是好友
 *
 * @param userId 用户ID
 * @return Boolean
 */
- (BOOL)isMyFriend:(NSString *)userId;

/**
 * 获取好友列表
 *
 * @param refresh 是否从服务器更新
 * @return 用户ID数组
 */
- (NSArray<NSString *> *)getMyFriendList:(BOOL)refresh;

/**
 * 搜索好友
 * @param keyword 好友关键字
 * @return 好友数组
 */
- (NSArray<WFCCUserInfo *> *)searchFriends:(NSString *)keyword;

/**
 发送好友请求

 @param userId 用户ID
 @param reason 请求说明
 @param block  回调
 */
- (void)sendFriendRequest:(NSString *)userId
                   reason:(NSString *)reason
                    block:(void (^)(int))block;

/**
 获取收到的好友请求

 @return 好友请求
 */
- (NSArray<WFCCFriendRequest *> *)getReceivedFriendRequest;

/**
 处理好友请求

 @param userId 用户ID
 @param accept 是否接受
 @param extra 附加信息，如果接受，附加信息会添加到好友附加信息中
 @param successBlock 成功的回调
 @param errorBlock 失败的回调
 */
- (void)handleFriendRequest:(NSString *)userId
                     accept:(BOOL)accept
                      extra:(NSString *)extra
                    success:(void (^)(void))successBlock
                      error:(void (^)(int error_code))errorBlock;

/**
 设置黑名单

 @param userId 用户ID
 @param isBlackListed YES 加入黑名单； NO 取消黑名单
 @param successBlock 成功的回调
 @param errorBlock 失败的回调
 */
- (void)setBlackList:(NSString *)userId
       isBlackListed:(BOOL)isBlackListed
             success:(void (^)(void))successBlock
               error:(void (^)(int error_code))errorBlock;
@end