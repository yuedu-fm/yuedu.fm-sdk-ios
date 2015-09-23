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

- (Class)modelClass {
    return [YDSDKArticleModel class];
}

@end
