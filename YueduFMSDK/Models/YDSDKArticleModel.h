//
//  YDSDKArticleModel.h
//  YueduFMSDK
//
//  Created by StarNet on 9/16/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKModel.h"

@interface YDSDKArticleModel : YDSDKModel

/** 文章编号 */
@property (nonatomic, assign) NSInteger aid;

/** 文章作者 */
@property (nonatomic, strong) NSString* author;

/** 播音员 */
@property (nonatomic, strong) NSString* speaker;

/** 时长 */
@property (nonatomic, assign) NSTimeInterval duration;

/** 播放次数 */
@property (nonatomic, assign) NSInteger playCount;

/** 声音url */
@property (nonatomic, strong) NSString* audioURL;

/** 内容 */
@property (nonatomic, strong) NSString* content;

@end
