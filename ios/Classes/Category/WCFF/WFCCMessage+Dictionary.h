//
// Created by 王斌 on 2020/4/8.
//

#import <Foundation/Foundation.h>
#import <WFChatClient/WFCCMessage.h>
#import <WFChatClient/WFCCTextMessageContent.h>
#import <WFChatClient/WFCCStickerMessageContent.h>
#import <WFChatClient/WFCCSoundMessageContent.h>


@interface WFCCTextMessageContent (Dictionary)
@property(readonly) NSDictionary *dictionary;
@end

@interface WFCCStickerMessageContent (Dictionary)
@property(readonly) NSDictionary *dictionary;
@end

@interface WFCCSoundMessageContent (Dictionary)
@property(readonly) NSDictionary *dictionary;
@end

@interface WFCCMessage (Dictionary)
@property(readonly) NSDictionary *dictionary;
@end