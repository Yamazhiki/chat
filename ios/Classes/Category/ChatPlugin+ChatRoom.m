//
// Created by 王斌 on 2020/4/7.
//

#import <WFChatClient/WFCCIMService.h>
#import "ChatPlugin+ChatRoom.h"


@implementation ChatPlugin (ChatRoom)
- (void)joinChatRoom:(NSString *)chatRoomId
             success:(void (^)(void))successBlock
               error:(void (^)(int))errorBlock {
    [WFCCIMService.sharedWFCIMService joinChatroom:chatRoomId
                                           success:successBlock
                                             error:errorBlock];
}

- (void)quitChatRoom:(NSString *)chatRoomId
             success:(void (^)(void))successBlock
               error:(void (^)(int))errorBlock {
    [WFCCIMService.sharedWFCIMService quitChatroom:chatRoomId
                                           success:successBlock
                                             error:errorBlock];
}

- (void)getChatRoomInfo:(NSString *)chatRoomId
                upateDt:(long long int)updateDt
                success:(void (^)(WFCCChatroomInfo *))successBlock
                  error:(void (^)(int))errorBlock {
    [WFCCIMService.sharedWFCIMService getChatroomInfo:chatRoomId
                                              upateDt:updateDt
                                              success:successBlock
                                                error:errorBlock];
}

- (void)getChatRoomMemberInfo:(NSString *)chatRoomId
                     maxCount:(int)maxCount
                      success:(void (^)(WFCCChatroomMemberInfo *))successBlock
                        error:(void (^)(int))errorBlock {
    [WFCCIMService.sharedWFCIMService getChatroomMemberInfo:chatRoomId
                                                   maxCount:maxCount
                                                    success:successBlock
                                                      error:errorBlock];
}

@end