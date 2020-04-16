//
// Created by 王斌 on 2020/4/7.
//

#import <WFChatClient/WFCCIMService.h>
#import <WFChatClient/Common.h>
#import <WFChatClient/WFCCTextMessageContent.h>
#import <WFChatClient/WFCCSoundMessageContent.h>
#import <WFChatClient/WFCCStickerMessageContent.h>
#import "ChatPlugin+Message.h"
#import "WFCCMessage+Dictionary.h"
#import "WFCCConversation+Dictionary.h"
#import "NSArray+BlocksKit.h"


@implementation ChatPlugin (Message)

- (void)registerMessageNotification {
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(sendMessageStatusUpdated:) name:kSendingMessageStatusUpdated object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(receiveMessages:) name:kReceiveMessages object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(recallMessages:) name:kRecallMessages object:nil];
}

- (void)removeMessageNotification {
    [NSNotificationCenter.defaultCenter removeObserver:self name:kSendingMessageStatusUpdated object:nil];
    [NSNotificationCenter.defaultCenter removeObserver:self name:kReceiveMessages object:nil];
    [NSNotificationCenter.defaultCenter removeObserver:self name:kRecallMessages object:nil];
}

- (void)recallMessages:(NSNotification *)notification {
    long long messageUid = [notification.object longLongValue];
    WFCCMessage *msg = [[WFCCIMService sharedWFCIMService] getMessageByUid:messageUid];
    if (msg) {
        self.eventSink(@{
                @"type": @(WFChatEventTypeReCall),
                @"message": msg.dictionary,
        });
    }
}


- (void)receiveMessages:(NSNotification *)notification {
    NSArray <WFCCMessage *> *messages = notification.object;
    self.eventSink([messages bk_map:^id(WFCCMessage *obj) {
        return obj.dictionary;
    }]);
}

- (void)sendMessageStatusUpdated:(NSNotification *)notification {
    WFCCMessage *message = notification.userInfo[@"message"];
    WFCCMessageStatus status = (WFCCMessageStatus) [notification.userInfo[@"status"] integerValue];
    self.eventSink(@{
            @"message": message.dictionary,
            @"status": @(status),
    });
}

- (id)sendMessage:(NSDictionary *)data {
    WFCCConversation *conversation = [[WFCCConversation alloc] init];
    [conversation setValuesForKeysWithDictionary:data[@"conversation"]];
    id content = data[@"content"];
    NSInteger type = [data[@"type"] integerValue];
    WFCCMessageContent *messageContent;
    switch (type) {
        case MESSAGE_CONTENT_TYPE_TEXT: {
            WFCCTextMessageContent *text = [WFCCTextMessageContent contentWith:content];
            messageContent = text;
            break;
        }
        case MESSAGE_CONTENT_TYPE_SOUND: {
            NSString *wavPath = content[@"wavPath"];
            long duration = [content[@"duration"] longValue];
            WFCCSoundMessageContent *sound = [WFCCSoundMessageContent soundMessageContentForWav:wavPath
                                                                                       duration:duration];
            messageContent = sound;
            break;
        }
        case MESSAGE_CONTENT_TYPE_STICKER: {
            WFCCStickerMessageContent *sticker = [WFCCStickerMessageContent contentFrom:content];
            messageContent = sticker;
            break;
        }
        default: {
            break;
        }
    }
    NSArray *toUsers = data[@"toUsers"];
    return [WFCCIMService.sharedWFCIMService send:conversation
                                          content:messageContent
                                          toUsers:toUsers
                                   expireDuration:0
                                          success:^(long long messageUid, long long timestamp) {
                                              self.eventSink(@{
                                                      @"type": @(WFChatEventTypeSendResult),
                                                      @"code": @(0),
                                                      @"messageUid": @(messageUid),
                                                      @"timestamp": @(timestamp)
                                              });
                                          }
                                            error:^(int code) {
                                                self.eventSink(@{
                                                        @"type": @(WFChatEventTypeSendResult),
                                                        @"code": @(code),
                                                        @"messageUid": @0,
                                                        @"timestamp": @0
                                                });
                                            }].dictionary;
}

- (NSArray<WFCCMessage *> *)searchMessage:(NSDictionary *)data {
    NSArray<WFCCMessage *> *rlt = [WFCCIMService.sharedWFCIMService searchMessage:[WFCCConversation from:data[@"conversation"]]
                                                                          keyword:data[@"keyword"]];
    return [rlt bk_map:^id(WFCCMessage *obj) {
        return obj.dictionary;
    }];
}


@end