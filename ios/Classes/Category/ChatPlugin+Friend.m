//
// Created by 王斌 on 2020/4/7.
//

#import <WFChatClient/WFCCIMService.h>
#import "ChatPlugin+Friend.h"
#import "NSArray+BlocksKit.h"
#import "WFCCFriendRequest+Dictionary.h"
#import "WFCCUserInfo+Dictionary.h"


@implementation ChatPlugin (Friend)
- (BOOL)isMyFriend:(NSString *)userId {
    return [WFCCIMService.sharedWFCIMService isMyFriend:userId];
}

- (NSArray<NSString *> *)getMyFriendList:(BOOL)refresh {
    return [WFCCIMService.sharedWFCIMService getMyFriendList:refresh];
}

- (NSArray<WFCCUserInfo *> *)searchFriends:(NSString *)keyword {
    return [[WFCCIMService.sharedWFCIMService searchFriends:keyword] bk_map:^id(WFCCUserInfo *obj) {
        return [obj dictionary];
    }];
}

- (void)sendFriendRequest:(NSString *)userId
                   reason:(NSString *)reason
                    block:(void (^)(int))block {
    [WFCCIMService.sharedWFCIMService sendFriendRequest:userId
                                                 reason:reason
                                                success:^() {
                                                    block(0);
                                                }
                                                  error:^(int code) {
                                                      block(code);
                                                  }];
}

- (NSArray<WFCCFriendRequest *> *)getReceivedFriendRequest {
    return [[WFCCIMService.sharedWFCIMService getIncommingFriendRequest] bk_map:^id(WFCCFriendRequest *obj) {
        return [obj dictionary];
    }];
}

- (void)handleFriendRequest:(NSString *)userId
                     accept:(BOOL)accept
                      extra:(NSString *)extra
                    success:(void (^)(void))successBlock
                      error:(void (^)(int))errorBlock {
    [WFCCIMService.sharedWFCIMService handleFriendRequest:userId accept:accept
                                                    extra:extra
                                                  success:successBlock
                                                    error:errorBlock];
}

- (void)setBlackList:(NSString *)userId
       isBlackListed:(BOOL)isBlackListed
             success:(void (^)(void))successBlock
               error:(void (^)(int))errorBlock {
    [WFCCIMService.sharedWFCIMService setBlackList:userId
                                     isBlackListed:isBlackListed
                                           success:successBlock
                                             error:errorBlock];
}


@end