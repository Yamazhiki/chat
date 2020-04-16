//
// Created by 王斌 on 2020/4/13.
//

#import "WFCCFriendRequest+Dictionary.h"


@implementation WFCCFriendRequest (Dictionary)
- (NSDictionary *)dictionary {
    return @{
            @"direction": @(self.direction),
            @"target": self.target,
            @"reason": self.reason,
            @"status": @(self.status),
            @"readStatus": @(self.readStatus),
            @"timestamp": @(self.timestamp)

    };
}
@end