//
// Created by 王斌 on 2020/4/7.
//

#import "WFCCConversation+Dictionary.h"


@implementation WFCCConversation (Dictionary)

- (NSDictionary *)dictionary {
    return @{
            @"type": @(self.type),
            @"target": self.target,
            @"line": @(self.line)
    };
}

+ (instancetype)from:(NSDictionary *)dictionary {
    WFCCConversation *conversation = [[WFCCConversation alloc] init];
    [conversation setValuesForKeysWithDictionary:dictionary];
    return conversation;
}


@end