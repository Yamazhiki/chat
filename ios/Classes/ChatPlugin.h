//
// Created by 王斌 on 2020/4/2.
// Copyright (c) 2020 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

typedef NS_ENUM(NSInteger, WFChatEventType) {
    WFChatEventTypeNone,
    WFChatEventTypeConnectStatus,
    WFChatEventTypeSendResult,
    WFChatEventTypeReceiveMessage,
    WFChatEventTypeReCall
};

typedef NS_ENUM(NSInteger, WFChatNetworkServiceStatus) {
    WFChatNetworkServiceStatusNone,
    WFChatNetworkServiceStatusLoginParamsError
};


@interface ChatPlugin : NSObject <FlutterPlugin>
@property(nonatomic, readonly, copy) FlutterEventSink eventSink;
@end
