//
//  YDSDKListRequest.m
//  YueduFMSDK
//
//  Created by StarNet on 9/18/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKListRequest.h"

@implementation YDSDKListRequest

- (Class)modelClass {
    return nil;
}

- (void)processResponseData:(NSDictionary* )data {
    NSArray* array = data[@"list"];
    NSMutableArray* result = [NSMutableArray array];
    for (NSDictionary* item in array) {
        [result addObject:[self.modelClass modelFromData:item]];
    }
    _modelArray = [NSArray arrayWithArray:result];
}

@end
