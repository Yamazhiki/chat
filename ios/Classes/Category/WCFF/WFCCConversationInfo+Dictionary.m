//
// Created by 王斌 on 2020/4/8.
//

#import "WFCCConversationInfo+Dictionary.h"
#import "WFCCMessage+Dictionary.h"


@implementation WFCCConversationInfo (Dictionary)
- (NSDictionary *)dictionary {
    return @{
            @"conversation": self.conversation,
            @"lastMessage": self.lastMessage.dictionary,
            @"draft": self.draft,
            @"timestamp": @(self.timestamp),
            @"isTop": @(self.isTop),
            @"isSilent": @(self.isSilent)
    };
}
@end