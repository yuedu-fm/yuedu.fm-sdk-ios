//
//  YDSDKRequest.h
//  YueduFMSDK
//
//  Created by StarNet on 9/16/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YDSDKRequest;
@class YDSDKError;

/**
 * 定义请求完成的Block
 *
 * @param request 当前请求项
 * @param successed 请求成功还是失败，当successed=YES表示成功，返回的参数位于request中，当successed=NO表示请求失败，失败原因位于_error中，详见ICError
 *
 */
typedef void(^ICCompletion)(YDSDKRequest* request, YDSDKError* error);

@interface YDSDKRequest : NSObject

@property (nonatomic, strong) NSString* baseURL;
@property (nonatomic, strong) NSURLSession* session;
@property (nonatomic, copy) ICCompletion completion;

+ (instancetype)request;

- (void)start;

- (void)cancel;

/** 需要在子类实现 */
- (NSString* )uri;

/**
 * 处理返回的数据
 *
 * @param data 返回的数据部分
 */
- (void)processResponseData:(NSData* )data;

@end
