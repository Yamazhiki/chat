//
// Created by 王斌 on 2020/4/8.
//

#import "WFCCUserInfo+Dictionary.h"


@implementation WFCCUserInfo (Dictionary)
- (NSDictionary *)dictionary {
    return @{
            @"userId": self.userId,
            @"name": self.name,
            @"displayName": self.displayName,
            @"gender": @(self.gender),
            @"portrait": self.portrait,
            @"mobile": self.mobile,
            @"email": self.email,
            @"address": self.address,
            @"company": self.company,
            @"social": self.social,
            @"extra": self.extra,
            @"friendAlias": self.friendAlias,
            @"groupAlias": self.groupAlias,
            @"updateDt": @(self.updateDt),
            @"type": @(self.type),
            @"deleted": @(self.deleted)
    };
}
@end