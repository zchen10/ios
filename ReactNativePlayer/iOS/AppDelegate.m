/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"

#import "RCTRootView.h"

#import "AVPlayerDemoPlaybackViewController.h"

@implementation AppDelegate

NSString * const TEST_VIDEO = @"http://clips.vorwaerts-gmbh.de/VfE_html5.mp4";
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSURL *jsCodeLocation;

  // Loading JavaScript code - uncomment the one you want.

  // OPTION 1
  // Load from development server. Start the server from the repository root:
  //
  // $ npm start
  //
  // To run on device, change `localhost` to the IP address of your computer, and make sure your computer and
  // iOS device are on the same Wi-Fi network.
  jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle"];

  // OPTION 2
  // Load from pre-bundled file on disk. To re-generate the static bundle, run
  //
  // $ curl http://localhost:8081/index.ios.bundle -o main.jsbundle
  //
  // and uncomment the next following line
  // jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];


  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    _playbackViewController = [[AVPlayerDemoPlaybackViewController alloc] initWithNibName:@"AVPlayerDemoPlaybackView" bundle:nil];
  } else {
    _playbackViewController = [[AVPlayerDemoPlaybackViewController alloc] initWithNibName:@"AVPlayerDemoPlaybackView-iPad" bundle:nil];
  }

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"AwesomeProject"
                                                   launchOptions:launchOptions];
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

  [_playbackViewController.view setFrame:self.window.frame];
  self.window.rootViewController = _playbackViewController;
  [rootView setFrame:self.window.frame];
  rootView.alpha = 0.5;
  [_playbackViewController.view addSubview:rootView];

  [self.window makeKeyAndVisible];

  _playbackViewController.URL = [NSURL URLWithString:TEST_VIDEO];

  return YES;
}

@end
