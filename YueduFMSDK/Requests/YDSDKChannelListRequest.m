//
//  YDSDKChannelListRequest.m
//  YueduFMSDK
//
//  Created by StarNet on 9/19/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKChannelListRequest.h"
#import "YDSDKChannelModel.h"

@implementation YDSDKChannelListRequest

- (NSString* )uri {
    return [NSString stringWithFormat:@"%@%@", self.config.apiChannels, self.config.apiSuffix];
}

- (void)processResponseData:(NSDictionary* )data {
    NSArray* array = data[@"list"];
    NSMutableArray* result = [NSMutableArray array];
    for (NSDictionary* item in array) {
        [result addObject:[self.modelClass modelFromData:item]];
    }
    _modelArray = [NSArray arrayWithArray:result];
}

- (Class)modelClass {
    return [YDSDKChannelModel class];
}

@end
