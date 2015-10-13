//
//  YDSDKDebug.h
//  YueduFMSDK
//
//  Created by StarNet on 9/17/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#ifdef DEBUG
#define __FILE_WITHOUT_PATH__ (strrchr(__FILE__, '/') ? strrchr(__FILE__, '/') + 1 : __FILE__)

#define YDSDKDebug(fmt, ...) \
do {\
NSLog(@"YueduFMSDK===>" fmt, ##__VA_ARGS__);\
} while(0);

#else
#define YDSDKDebug(fmt, ...);
#endif
