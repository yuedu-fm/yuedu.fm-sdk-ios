//
//  YDSDKChannelListRequest.h
//  YueduFMSDK
//
//  Created by StarNet on 9/19/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import <YueduFMSDK/YueduFMSDK.h>

@interface YDSDKChannelListRequest : YDSDKRequest

@property (nonatomic, readonly) NSArray* modelArray;

// 子类继承
- (Class)modelClass;

@end
