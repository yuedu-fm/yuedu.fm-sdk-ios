//
//  YDSDKChannelModel.m
//  YueduFMSDK
//
//  Created by StarNet on 9/18/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKChannelModel.h"

@implementation YDSDKChannelModel

+ (id)modelFromData:(NSDictionary* )data {
    YDSDKChannelModel* model = [super modelFromData:data];
    if (model) {
        model.aid   = [data[@"id"] intValue];
        model.name  = data[@"name"];
    }
    return model;
}

- (NSString* )description {
    return [NSString stringWithFormat:@"id:%ld, name=%@", (long)self.aid, self.name];
}

@end
