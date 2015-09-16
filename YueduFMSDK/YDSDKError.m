//
//  YDSDKError.m
//  YueduFMSDK
//
//  Created by StarNet on 9/17/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKError.h"

static NSString* const YDSDKErrorDomain = @"YDSDKErrorDomain";

@implementation YDSDKError

+ (instancetype)errorWithCode:(YDSDKErrorCode)code {
    return [self errorWithDomain:YDSDKErrorDomain code:code userInfo:nil];
}

@end
