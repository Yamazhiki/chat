//
// Created by 王斌 on 2020/4/8.
//

#import "WFCCMessage+Dictionary.h"

@implementation WFCCTextMessageContent (Dictionary)
- (NSDictionary *)dictionary {
    return @{
            @"text": self.text,
            @"mentionedType": @(self.mentionedType),
            @"mentionedTargets": self.mentionedTargets
    };
}
@end

@implementation WFCCStickerMessageContent (Dictionary)
- (NSDictionary *)dictionary {
    return @{
            @"localPath": self.localPath,
            @"remoteUrl": self.remoteUrl,
            @"width": @(self.size.width),
            @"height": @(self.size.height)
    };
}
@end

@implementation WFCCSoundMessageContent (Dictionary)
- (NSDictionary *)dictionary {
    return @{
            @"localPath": self.localPath,
            @"remoteUrl": self.remoteUrl,
            @"duration": @(self.duration)
    };
}
@end


@implementation WFCCMessage (Dictionary)
- (NSDictionary *)dictionary {
    return @{
            @"messageId": @(self.messageId),
            @"messageUid": @(self.messageUid),
            @"conversation": self.conversation,
            @"fromUser": self.fromUser,
            @"toUsers": self.toUsers,
            @"content": self.entity,
            @"contentType": @(self.contentType),
            @"direction": @(self.direction),
            @"status": @(self.status),
            @"serverTime": @(self.serverTime),

    };
}

- (id)entity {
    if ([self.content isKindOfClass:[WFCCTextMessageContent class]]) {
        return [(WFCCTextMessageContent *) self.content dictionary];
    } else if ([self.content isKindOfClass:[WFCCStickerMessageContent class]]) {
        return [(WFCCStickerMessageContent *) self.content dictionary];
    } else if ([self.content isKindOfClass:[WFCCSoundMessageContent class]]) {
        return [(WFCCSoundMessageContent *) self.content dictionary];
    }
    return @{};
}

- (int)contentType {
    id <WFCCMessageContent> cls = (id <WFCCMessageContent>) self.content;
    return [cls getContentType];
}

@end