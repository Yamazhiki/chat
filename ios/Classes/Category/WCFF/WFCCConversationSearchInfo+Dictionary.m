//
// Created by 王斌 on 2020/4/8.
//

#import "WFCCConversationSearchInfo+Dictionary.h"


@implementation WFCCConversationSearchInfo (Dictionary)
- (NSDictionary *)dictionary {
    return @{
            @"conversation": self.conversation,
            @"message": self.marchedMessage,
            @"count": @(self.marchedCount),
            @"keyword": self.keyword
    };
}
@end