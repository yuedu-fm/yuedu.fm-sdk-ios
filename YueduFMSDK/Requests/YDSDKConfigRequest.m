//
//  YDSDKConfigRequest.m
//  YueduFMSDK
//
//  Created by StarNet on 9/19/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKConfigRequest.h"
#import "YDSDKConfigModel.h"

@implementation YDSDKConfigRequest

- (NSString* )uri {
    return @"http://7xlwed.com1.z0.glb.clouddn.com/config.jpg";
}

- (BOOL)shouldUseConfig {
    return NO;
}

- (void)processResponseData:(NSDictionary* )data {
    _model = [YDSDKConfigModel modelFromData:data];
}

@end
