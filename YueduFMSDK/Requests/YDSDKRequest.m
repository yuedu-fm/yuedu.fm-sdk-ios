//
//  YDSDKRequest.m
//  YueduFMSDK
//
//  Created by StarNet on 9/16/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKRequest.h"
#import "YDSDKError.h"

@interface YDSDKRequest () {
    NSURLRequest*           _request;
    NSURLSessionDataTask*   _task;
    BOOL                    _done;
    BOOL                    _isCanceled;
}
@end

@implementation YDSDKRequest

+ (id)request {
    return [[[self class] alloc] init];
}

- (void)start {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        _request = [self urlRequest];
        
        [self didRequest];
        
        //wait for done
        while (!_done) {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
    });
}

- (void)cancel {
    [_task cancel];
}

- (NSURLRequest *)urlRequest {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", _baseURL, self.uri]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    return request;
}

- (void)didRequest {
    _task = [self.session dataTaskWithRequest:_request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            [self processResponseData:data];
            [self didFinish:nil];
        } else {
            [self didFinish:[YDSDKError errorWithCode:error.code]];
        }
    }];
}

- (void)didFinish:(YDSDKError* )error {
    //如果已经取消，则不调用回调
    if (_completion && !_isCanceled) {
        _completion(self, error);
    }
    _done = YES;
}


- (NSString* )uri {
    return @"";
}

- (void)processResponseData:(NSDictionary* )data {
    
}

@end
