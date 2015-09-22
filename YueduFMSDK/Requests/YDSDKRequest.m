//
//  YDSDKRequest.m
//  YueduFMSDK
//
//  Created by StarNet on 9/16/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "YDSDKRequest.h"
#import "YDSDKError.h"
#import "YDSDKDebug.h"

@interface YDSDKRequest () {
    NSMutableURLRequest*    _request;
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

- (NSMutableURLRequest *)urlRequest {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", self.uri]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    return request;
}

- (void)didRequest {
    
    if ([self shouldUseConfig] && !self.config) {
        [self didFinish:[YDSDKError errorWithCode:YDSDKErrorCodeNotConfiged]];
    } else {
        YDSDKDebug(@"Request:%@", _request.URL.absoluteString);
        _task = [self.session dataTaskWithRequest:_request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (!error) {
                NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                
                YDSDKDebug(@"Response:%@", json?json:@"");

                [self processResponseData:json];
                [self didFinish:nil];
            } else {
                [self didFinish:[YDSDKError errorWithCode:error.code]];
            }
        }];
        [_task resume];
    }
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

- (BOOL)shouldUseConfig {
    return YES;
}

- (void)processResponseData:(NSDictionary* )data {
    
}

@end
