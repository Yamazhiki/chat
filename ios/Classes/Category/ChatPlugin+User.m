//
// Created by 王斌 on 2020/4/7.
//

#import <WFChatClient/WFCCUserInfo.h>
#import <WFChatClient/WFCCIMService.h>
#import "ChatPlugin+User.h"
#import "WFCCUserInfo+Dictionary.h"
#import "NSArray+BlocksKit.h"


@implementation ChatPlugin (User)
- (NSDictionary *)getUserInfo:(NSString *)userId refresh:(BOOL)refresh {
    return [[WFCCIMService.sharedWFCIMService getUserInfo:userId refresh:refresh] dictionary];
}

- (void)searchUser:(NSString *)keyword
        searchType:(int)searchType
              page:(int)page
             block:(void (^)(NSArray<WFCCUserInfo *> *, int))block {
    [WFCCIMService.sharedWFCIMService searchUser:keyword
                                      searchType:(WFCCSearchUserType) searchType
                                            page:page
                                         success:^(NSArray<WFCCUserInfo *> *users) {
                                             block([users bk_map:^id(WFCCUserInfo *user) {
                                                 return user.dictionary;
                                             }], 0);
                                         }
                                           error:^(int errorCode) {
                                               block(nil, 0);

                                           }];
}


@end