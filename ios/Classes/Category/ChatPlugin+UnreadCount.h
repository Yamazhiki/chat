//
// Created by 王斌 on 2020/4/3.
//

#import <Foundation/Foundation.h>
#import "ChatPlugin.h"

@class WFCCUnreadCount;

@interface ChatPlugin (UnreadCount)
/**
 * 获取某个回话的未读数
 * @param dictionary NSDictionary
 * @return WFCCUnreadCount
 */
- (WFCCUnreadCount *)getUnreadCount:(NSDictionary *)dictionary;

/**
 *
 * @param conversationTypes 获取指定类型会话的所有未读数
 * @param lines 啥？
 * @return WFCCUnreadCount
 */
- (WFCCUnreadCount *)getUnreadCount:(NSArray<NSNumber *> *)conversationTypes
                              lines:(NSArray<NSNumber *> *)lines;

/**
 * 清除某个会话的未读消息数
 * @param dictionary  会话类型
 */
- (void)clearUnreadStatus:(NSDictionary *)dictionary;

/**
 * 清除某种类型会话的未读数
 * @param conversationTypes 会话类型
 * @param lines 啥？
 */
- (void)clearUnreadStatus:(NSArray<NSNumber *> *)conversationTypes
                    lines:(NSArray<NSNumber *> *)lines;

/**
 * 清空所有未读消息
 */
- (void)clearAllUnreadStatus;

/**
 * 设置指定消息为已读
 * @param messageId 消息ID
 */
- (void)setMediaMessagePlayed:(long)messageId;
@end