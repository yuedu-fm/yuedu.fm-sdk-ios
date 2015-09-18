//
//  YDSDKModel.m
//  YueduFMSDK
//
//  Created by StarNet on 9/16/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKModel.h"

@implementation YDSDKModel

+ (id)modelFromData:(NSDictionary* )data {
    if (!data || ![[data allKeys] count]) return nil;
    return [[[self class] alloc] init];
}

@end
