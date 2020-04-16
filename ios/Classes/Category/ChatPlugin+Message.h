//
// Created by 王斌 on 2020/4/7.
//

#import <Foundation/Foundation.h>
#import "ChatPlugin.h"


@interface ChatPlugin (Message)

- (void)registerMessageNotification;

- (void)removeMessageNotification;

/**
 * 发送消息
 * @param data 发送数据
 * @return NSDictionary
 */
- (id)sendMessage:(NSDictionary *)data;

/**
 * 搜索消息
 * @param data 搜索数据
 * @return NSArray
 */
- (NSArray<NSDictionary *> *)searchMessage:(NSDictionary *)data;
@end