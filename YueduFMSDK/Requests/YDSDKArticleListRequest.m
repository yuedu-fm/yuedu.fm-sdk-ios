//
//  YDSDKArticleListRequest.m
//  YueduFMSDK
//
//  Created by StarNet on 9/18/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKArticleListRequest.h"
#import "YDSDKArticleModel.h"

@implementation YDSDKArticleListRequest

- (NSString* )uri {
    if (self.articleId == 0) {
        self.articleId = self.config.latestArticleId;
    }
    return [NSString stringWithFormat:@"%@%d%@", self.config.apiArticles, self.articleId/self.config.section, self.config.apiSuffix];
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
    return [YDSDKArticleModel class];
}

@end
