//
//  YDSDKArticleModel.m
//  YueduFMSDK
//
//  Created by StarNet on 9/16/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKArticleModel.h"

@implementation YDSDKArticleModel

+ (id)modelFromData:(NSDictionary* )data {
    YDSDKArticleModel* model = [super modelFromData:data];
    if (model) {
        model.aid       = [data[@"id"] intValue];
        model.channel   = [data[@"channel"] intValue];
        model.url       = data[@"url"];
        model.title     = data[@"title"];
        model.author    = data[@"author"];
        model.speaker   = data[@"speaker"];
        model.abstract  = data[@"abstract"];
        model.duration  = [data[@"duration"] intValue];
        model.playCount = [data[@"play-count"] intValue];
        model.pictureURL= data[@"picture"];
        model.audioURL  = data[@"audio"];
    }
    return model;
}

- (NSString* )description {
    return [NSString stringWithFormat:@"aid:%d, title:%@, author:%@, speaker:%@, duration:%d, playCount:%d, picture:%@, audio:%@, abstract=%@", self.aid, self.title, self.author, self.speaker, self.duration, self.playCount, self.pictureURL, self.audioURL, self.abstract];
}

@end
