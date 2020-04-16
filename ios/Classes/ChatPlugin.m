//
// Created by 王斌 on 2020/4/2.
// Copyright (c) 2020 Yamazhiki. All rights reserved.
//

#import "ChatPlugin.h"
#import <WFChatClient/WFCChatClient.h>
#import "ChatPlugin+ConnectionStatusDelegate.h"
#import "ChatPlugin+ReceiveMessageDelegate.h"
#import "ChatPlugin+User.h"
#import "ChatPlugin+Conversation.h"
#import "ChatPlugin+Message.h"
#import "ChatPlugin+Friend.h"

NSString *const WF_METHOD_CHANNEL = @"io.newstyle.flutter.plugin.wildfirechat.chat/method";
NSString *const WF_EVENT_CHANNEL = @"io.newstyle.flutter.plugin.wildfirechat.chat/event";

@interface ChatPlugin () <FlutterStreamHandler>
@end


@implementation ChatPlugin

- (instancetype)init {
    self = [super init];
    [WFCCNetworkService startLog];
//    WFCCNetworkService.sharedInstance.connectionStatusDelegate = self;
//    WFCCNetworkService.sharedInstance.receiveMessageDelegate = self;
    return self;
}


#pragma mark - FlutterPlugin

+ (void)registerWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
    ChatPlugin *plugin = [[ChatPlugin alloc] init];
    FlutterMethodChannel *methodChannel = [FlutterMethodChannel methodChannelWithName:WF_METHOD_CHANNEL binaryMessenger:[registrar messenger]];
    [registrar addMethodCallDelegate:plugin channel:methodChannel];

    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:WF_EVENT_CHANNEL binaryMessenger:[registrar messenger]];
    [eventChannel setStreamHandler:plugin];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSString *method = call.method;
    NSDictionary *params = call.arguments;
    if ([@"getClientId" isEqualToString:call.method]) {
        result(WFCCNetworkService.sharedInstance.getClientId);
    } else if ([@"connect" isEqualToString:call.method]) {
        [WFCCNetworkService.sharedInstance connect:params[@"userId"] token:params[@"token"]];
    } else if ([@"serverAddress" isEqualToString:call.method]) {
        [WFCCNetworkService.sharedInstance setServerAddress:params[@"serverAddress"]];
    } else if ([@"disconnect" isEqualToString:call.method]) {
        [WFCCNetworkService.sharedInstance disconnect:[params[@"clearSession"] boolValue]];
    } else if ([@"isLogin" isEqualToString:call.method]) {
        result(@( [WFCCNetworkService.sharedInstance isLogined]));
    } else if ([@"serverDeltaTime" isEqualToString:call.method]) {
        result(@(WFCCNetworkService.sharedInstance.serverDeltaTime));
    }
#pragma mark 用户相关 -----
    if ([@"getUserInfo" isEqualToString:method]) {
        result([self getUserInfo:params[@"userId"] refresh:[params[@"refresh"] boolValue]]);
    } else if ([@"searchUser" isEqualToString:method]) {
        [self searchUser:params[@"keyword"]
              searchType:[params[@"searchType"] boolValue]
                    page:[params[@"page"] intValue]
                   block:^(NSArray *users, int code) {
                       result(@{@"users": users ? (id) users : [NSNull null], @"code": @(code)});
                   }];
    }
#pragma  mark 好友相关 -----
    if ([@"searchFriends" isEqualToString:method]) {
        result([self searchFriends:params[@"keyword"]]);
    } else if ([@"sendFriendRequest" isEqualToString:method]) {
        [self sendFriendRequest:params[@"userId"] reason:params[@"reason"] block:^(int i) {
            result(@(i));
        }];
    } else if ([@"getReceivedFriendRequests" isEqualToString:method]) {
        result([self getReceivedFriendRequest]);
    } else if ([@"handleFriendRequest" isEqualToString:method]) {
        [self handleFriendRequest:params[@"userId"]
                           accept:[params[@"accept"] boolValue]
                            extra:params[@"extra"]
                          success:^{
                              result(@0);
                          }
                            error:^(int error_code) {
                                result(@(error_code));
                            }];
    } else if ([@"setBlackList" isEqualToString:method]) {
        [self setBlackList:params[@"userId"]
             isBlackListed:[params[@"isBlackListed"] boolValue]
                   success:^{
                       result(@0);
                   }
                     error:^(int error_code) {
                         result(@(error_code));
                     }];
    }
#pragma mark 会话相关 -----
    if ([@"getConversationInfos" isEqualToString:method]) {
        result([self getConversationInfos:params]);
    } else if ([@"searchConversation" isEqualToString:method]) {
        result([self searchConversation:params]);
    } else if ([@"removeConversation" isEqualToString:method]) {
        [self removeConversation:params];
    } else if ([@"setDraftConversation" isEqualToString:method]) {
        [self setDraftConversation:params];
    } else if ([@"setTopConversation" isEqualToString:method]) {
        [self setTopConversation:params block:^(int i) {
            result(@(i));
        }];
    } else if ([@"setSilentConversation" isEqualToString:method]) {
        [self setSilentConversation:params block:^(int i) {
            result(@(i));
        }];
    }
#pragma mark 消息相关 -----
    if ([@"sendMessage" isEqualToString:method]) {
        result([self sendMessage:params]);
    } else if ([@"searchMessage" isEqualToString:method]) {
        result([self searchMessage:params]);
    }

}

#pragma mark - FlutterStreamHandler

- (FlutterError *_Nullable)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events {
    _eventSink = events;
    [self registerMessageNotification];
//    [WFCCNetworkService.sharedInstance setServerAddress:@"152.136.93.14:1883"];
//    [WFCCNetworkService.sharedInstance connect:@"010E0EWW" token:@"ZEznXDmtV5Cx8gNiyymVfLrXanvBBMJhoI20I4PcPncAFHDxFAT/ykSmu04oKwJOoSSHS/fp7o8d8w42fMO980HZKz9ObV5cu7khD2KruX5EEToItltZKe+qfLlPTHy3W/ZlheKXbquaVtSmxAPLLtYgIhiKXvKlO+ncmjIaVoQ="];
    return nil;
}

- (FlutterError *_Nullable)onCancelWithArguments:(id)arguments {
    [self removeMessageNotification];
    _eventSink = nil;
    return nil;
}


@end
