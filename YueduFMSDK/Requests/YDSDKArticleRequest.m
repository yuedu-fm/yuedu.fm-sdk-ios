//
//  YDSDKArticleRequest.m
//  YueduFMSDK
//
//  Created by StarNet on 9/16/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKArticleRequest.h"
#import "TFHpple.h"

@implementation YDSDKArticleRequest

- (NSString* )uri {
    return [NSString stringWithFormat:@"/article/%ld", (long)self.articleId];
}

- (void)processResponseData:(NSData *)data {
    TFHpple* doc = [[TFHpple alloc] initWithHTMLData:data];
    
    NSLog(@"==========1111");
}

@end
