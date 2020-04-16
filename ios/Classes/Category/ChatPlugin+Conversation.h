//
// Created by 王斌 on 2020/4/3.
//

#import <Foundation/Foundation.h>
#import "ChatPlugin.h"

@interface ChatPlugin (Conversation)
- (id)getConversationInfos:(NSDictionary *)params;

- (id)searchConversation:(NSDictionary *)params;

- (void)removeConversation:(NSDictionary *)params;

- (void)setTopConversation:(NSDictionary *)params
                     block:(void (^)(int))block;

- (void)setSilentConversation:(NSDictionary *)params
                        block:(void (^)(int))block;

- (void)setDraftConversation:(NSDictionary *)params;
@end