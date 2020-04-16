//
// Created by 王斌 on 2020/4/7.
//

#import <Foundation/Foundation.h>
#import <WFChatClient/WFCCConversation.h>

@interface WFCCConversation (Dictionary)
@property(readonly) NSDictionary *dictionary;
+ (instancetype)from:(NSDictionary *)dictionary;
@end