//
// Created by 王斌 on 2020/4/3.
//

#import <WFChatClient/WFCCConversation.h>
#import <WFChatClient/WFCCIMService.h>
#import "ChatPlugin+UnreadCount.h"


@implementation ChatPlugin (UnreadCount)
- (WFCCUnreadCount *)getUnreadCount:(NSDictionary *)dictionary {
    WFCCConversation *conversation = [[WFCCConversation alloc] init];
    [conversation setValuesForKeysWithDictionary:dictionary];
    return [WFCCIMService.sharedWFCIMService getUnreadCount:conversation];
}

- (WFCCUnreadCount *)getUnreadCount:(NSArray<NSNumber *> *)conversationTypes lines:(NSArray<NSNumber *> *)lines {
    return [WFCCIMService.sharedWFCIMService getUnreadCount:conversationTypes lines:lines];
}


- (void)clearUnreadStatus:(NSDictionary *)dictionary {
    WFCCConversation *conversation = [[WFCCConversation alloc] init];
    [conversation setValuesForKeysWithDictionary:dictionary];
    [WFCCIMService.sharedWFCIMService clearUnreadStatus:conversation];
}

- (void)clearUnreadStatus:(NSArray<NSNumber *> *)conversationTypes lines:(NSArray<NSNumber *> *)lines {
    [WFCCIMService.sharedWFCIMService clearUnreadStatus:conversationTypes lines:lines];
}


- (void)clearAllUnreadStatus {
    [WFCCIMService.sharedWFCIMService clearAllUnreadStatus];
}

- (void)setMediaMessagePlayed:(long)messageId {
    [WFCCIMService.sharedWFCIMService setMediaMessagePlayed:messageId];
}


@end