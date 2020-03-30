//
//  AppDelegate.m
//  NSURLComponents_test
//
//  Created by Gregory Casamento on 3/30/20.
//  Copyright © 2020 Open Logic Corporation. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (retain) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSURLComponents *components = [NSURLComponents componentsWithURL:[NSURL URLWithString:@"https://some.host.com"] resolvingAgainstBaseURL:NO];
        components.queryItems = @[
            [NSURLQueryItem queryItemWithName:@"lang" value:@"en"],
            [NSURLQueryItem queryItemWithName:@"response_type" value:@"code"]
        ];
    NSLog(@"%@", components.URL); // returns "https://some.host.com", without the query items
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
