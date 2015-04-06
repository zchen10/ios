//
//  NativeEventBridge.h
//  AwesomeProject
//
//  Created by Zhihui Chen on 4/2/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"
#import "RCTLog.h"

@interface NativeEventBridge : NSObject<RCTBridgeModule>

- (void)emitEvent:(NSString *)playhead duration:(NSString *)duration;

@end
