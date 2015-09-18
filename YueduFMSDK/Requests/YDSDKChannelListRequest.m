//
//  YDSDKChannelListRequest.m
//  YueduFMSDK
//
//  Created by StarNet on 9/18/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKChannelListRequest.h"
#import "YDSDKChannelModel.h"

@implementation YDSDKChannelListRequest

- (NSString* )uri {
    return [NSString stringWithFormat:@"%@%@", self.config.apiChannels, self.config.apiSuffix];
}

- (Class)modelClass {
    return [YDSDKChannelModel class];
}

@end
