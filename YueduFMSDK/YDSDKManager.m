//
//  YDSDKManager.m
//  YueduFMSDK
//
//  Created by StarNet on 9/16/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKManager.h"

static NSString* const kBaseURL = @"http://yuedu.fm";

@interface YDSDKManager () <NSURLSessionDelegate> {
    NSURLSession*   _session;
    NSMutableSet*   _requests;
}

@end

@implementation YDSDKManager

+ (instancetype)defaultManager {
    static YDSDKManager* manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YDSDKManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
    }
    return self;
}

- (void)addRequestSafely:(YDSDKRequest* )request {
    @synchronized(_requests) {
        [_requests addObject:request];
    }
}

- (void)removeRequestSafely:(YDSDKRequest* )request {
    @synchronized(_requests) {
        [_requests removeObject:request];
    }
}

- (void)removeAllRequestSafely {
    @synchronized(_requests) {
        for (YDSDKRequest* request in _requests) {
            [request cancel];
        }
        
        [_requests removeAllObjects];
    }
}

- (YDSDKRequest* )request:(YDSDKRequest* )request completion:(YDSDKCompletion)completion {
    request.completion = ^(YDSDKRequest* request, YDSDKError* error) {
        [self removeRequestSafely:request];
        if (completion) completion(request, error);
    };
    request.baseURL = kBaseURL;
    request.session = _session;
    
    [self addRequestSafely:request];
    [request start];
    return request;
}

- (void)cancelRequest:(YDSDKRequest* )request {
    [self removeRequestSafely:request];
    [request cancel];
}

- (void)cancelAllRequest {
    [self removeAllRequestSafely];
}

@end
