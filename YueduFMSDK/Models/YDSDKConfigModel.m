//
//  YDSDKConfigModel.m
//  YueduFMSDK
//
//  Created by StarNet on 9/19/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKConfigModel.h"

@implementation YDSDKConfigModel
+ (id)modelFromData:(NSDictionary* )data {
    YDSDKConfigModel* model = [super modelFromData:data];
    if (model) {
        model.baseURL = data[@"base-url"];
        model.section = [data[@"section"] intValue];
        model.latestArticleId = [data[@"latest-article-id"] intValue];
        model.apiChannels = data[@"api-channels"];
        model.apiArticles = data[@"api-articles"];
        model.apiSuffix = data[@"api-suffix"];
    }
    return model;
}
@end
