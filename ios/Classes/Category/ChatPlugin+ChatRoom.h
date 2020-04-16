//
// Created by 王斌 on 2020/4/7.
//

#import <Foundation/Foundation.h>
#import "ChatPlugin.h"

@class WFCCChatroomInfo;
@class WFCCChatroomMemberInfo;

@interface ChatPlugin (ChatRoom)
/**
 * 加入聊天室
 * @param chatRoomId 聊天室ID
 * @param successBlock 成功回调
 * @param errorBlock 失败回掉
 */
- (void)joinChatRoom:(NSString *)chatRoomId
             success:(void (^)(void))successBlock
               error:(void (^)(int error_code))errorBlock;

/**
 * 退出聊天室
 * @param chatRoomId 聊天室ID
 * @param successBlock 成功回调
 * @param errorBlock 失败回掉
 */
- (void)quitChatRoom:(NSString *)chatRoomId
             success:(void (^)(void))successBlock
               error:(void (^)(int error_code))errorBlock;

/**
 * 获取聊天室信息
 * @param chatRoomId 聊天室ID
 * @param updateDt 时间
 * @param successBlock 成功回调
 * @param errorBlock 失败回掉
 */
- (void)getChatRoomInfo:(NSString *)chatRoomId
                upateDt:(long long)updateDt
                success:(void (^)(WFCCChatroomInfo *chatRoomInfo))successBlock
                  error:(void (^)(int error_code))errorBlock;

/**
 *
 * @param chatRoomId 聊天室ID
 * @param maxCount 获取聊天室成员
 * @param successBlock 成功回调
 * @param errorBlock 失败回掉
 */
- (void)getChatRoomMemberInfo:(NSString *)chatRoomId
                     maxCount:(int)maxCount
                      success:(void (^)(WFCCChatroomMemberInfo *memberInfo))successBlock
                        error:(void (^)(int error_code))errorBlock;
@end