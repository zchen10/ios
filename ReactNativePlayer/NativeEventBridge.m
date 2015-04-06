//
//  NativeEventBridge.m
//  AwesomeProject
//
//  Created by Zhihui Chen on 4/2/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "NativeEventBridge.h"
#import "AppDelegate.h"
#import "AVPlayerDemoPlaybackViewController.h"

#import "RCTBridge.h"
#import "RCTEventDispatcher.h"

@implementation NativeEventBridge

@synthesize bridge = _bridge;

+ (id)allocWithZone:(NSZone *)zone
{
  static NativeEventBridge *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [super allocWithZone:zone];
  });
  return sharedInstance;
}

- (void)onPress:(NSString *)name {
  RCT_EXPORT();
  AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
  [appDelegate.playbackViewController togglePlayPause];
}

- (void)emitEvent:(NSString *)playhead duration:(NSString *)duration {
  [_bridge.eventDispatcher sendDeviceEventWithName:@"ppp" body:@{@"duration":duration, @"playhead":playhead}];
}

@end
