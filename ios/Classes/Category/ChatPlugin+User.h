//
// Created by 王斌 on 2020/4/7.
//

#import <Foundation/Foundation.h>
#import "ChatPlugin.h"

@class WFCCUserInfo;

@interface ChatPlugin (User)
/**
 获取用户信息

 @param userId 用户ID
 @param refresh 是否强制从服务器更新，如果本地没有或者强制，会从服务器刷新，然后发出通知kUserInfoUpdated。
 @return 本地的用户信息，可能为空
 */
- (NSDictionary *)getUserInfo:(NSString *)userId
                      refresh:(BOOL)refresh;

/**
 搜索用户

 @param keyword 关键词
 @param searchType 搜索类型
 @param page 页码
 */
- (void)searchUser:(NSString *)keyword
        searchType:(int)searchType
              page:(int)page
             block:(void (^)(NSArray<WFCCUserInfo *> *, int))block;
@end