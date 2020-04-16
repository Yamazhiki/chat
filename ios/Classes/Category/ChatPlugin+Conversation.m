//
// Created by 王斌 on 2020/4/3.
//

#import <WFChatClient/WFCCIMService.h>
#import "ChatPlugin+Conversation.h"
#import "WFCCConversationSearchInfo+Dictionary.h"
#import "WFCCConversationInfo+Dictionary.h"
#import "NSArray+BlocksKit.h"
#import "WFCCConversation+Dictionary.h"


@implementation ChatPlugin (Conversation)
- (NSArray *)getConversationInfos:(NSDictionary *)params {
    NSArray<WFCCConversationInfo *> *rlt = [WFCCIMService.sharedWFCIMService getConversationInfos:params[@"conversationTypes"]
                                                                                            lines:params[@"lines"]];
    return [rlt bk_map:^id(WFCCConversationInfo *info) {
        return info.dictionary;
    }];
}


- (id)searchConversation:(NSDictionary *)params {
    NSArray<WFCCConversationSearchInfo *> *rlt = [WFCCIMService.sharedWFCIMService searchConversation:params[@"keyword"]
                                                                                       inConversation:params[@"inConversation"]
                                                                                                lines:params[@"lines"]];
    return [rlt bk_map:^id(WFCCConversationSearchInfo *info) {
        return info.dictionary;
    }];
}

- (void)removeConversation:(NSDictionary *)params {
    WFCCConversation *conversation = [WFCCConversation from:params[@"conversation"]];
    [WFCCIMService.sharedWFCIMService removeConversation:conversation
                                            clearMessage:[params[@"clearMessage"] boolValue]];
}

- (void)setTopConversation:(NSDictionary *)params
                     block:(void (^)(int))block {
    WFCCConversation *conversation = [WFCCConversation from:params[@"conversation"]];
    BOOL isTop = [params[@"isTop"] boolValue];
    [WFCCIMService.sharedWFCIMService setConversation:conversation top:isTop
                                              success:^{
                                                  block(0);
                                              }
                                                error:^(int code) {
                                                    block(code);
                                                }];

}

- (void)setSilentConversation:(NSDictionary *)params
                        block:(void (^)(int))block {
    WFCCConversation *conversation = [WFCCConversation from:params[@"conversation"]];
    BOOL isSilent = [params[@"isSilent"] boolValue];
    [WFCCIMService.sharedWFCIMService setConversation:conversation
                                               silent:isSilent
                                              success:^{
                                                  block(0);
                                              }
                                                error:^(int code) {
                                                    block(code);
                                                }];

}

- (void)setDraftConversation:(NSDictionary *)params {
    WFCCConversation *conversation = [WFCCConversation from:params[@"conversation"]];
    [WFCCIMService.sharedWFCIMService setConversation:conversation draft:params[@"draft"]];
}

@end