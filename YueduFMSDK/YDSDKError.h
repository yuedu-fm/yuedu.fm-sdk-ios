//
//  YDSDKError.h
//  YueduFMSDK
//
//  Created by StarNet on 9/17/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, YDSDKErrorCode) {
    YDSDKErrorCodeNotConfiged = 10000,
};

@interface YDSDKError : NSError

+ (instancetype)errorWithCode:(YDSDKErrorCode)code;

@end
