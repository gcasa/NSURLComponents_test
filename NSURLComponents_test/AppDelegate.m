//
//  AppDelegate.m
//  NSURLComponents_test
//
//  Created by Gregory Casamento on 3/30/20.
//  Copyright © 2020 Open Logic Corporation. All rights reserved.
//

#import "AppDelegate.h"

void passTest(BOOL flag,
              NSString *msg)
{
    if(flag == YES)
    {
        NSLog(@"PASS: %@",msg);
    }
    else
    {
        NSLog(@"FAIL: %@",msg);
    }
}

@interface AppDelegate ()

@property (retain) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSURLComponents *components = [NSURLComponents componentsWithURL:[NSURL URLWithString:@"https://user:password@some.host.com"] resolvingAgainstBaseURL:NO];
    
    passTest([[[components URL] absoluteString] isEqualToString: @"https://user:password@some.host.com"], @"Absolute URL string is correct");
    
    components.queryItems = [NSArray arrayWithObjects:
                                [NSURLQueryItem queryItemWithName:@"lang" value:@"en"],
                                    [NSURLQueryItem queryItemWithName:@"response_type" value:@"code"],
                                    [NSURLQueryItem queryItemWithName:@"uri" value:[NSURL URLWithString:@"https://some.url.com/path?param1=one&param2=two"].absoluteString],
                             nil];
    // URL
    passTest([[components string] isEqualToString:              @"https://user:password@some.host.com?lang=en&response_type=code&uri=https://some.url.com/path?param1%3Done%26param2%3Dtwo"],
             @"URL string is correct");
    
    // encoded...
    passTest([[components percentEncodedQuery] isEqualToString:
              @"lang=en&response_type=code&uri=https://some.url.com/path?param1%3Done%26param2%3Dtwo"],
             @"percentEncodedQuery is correct");
    passTest([[components percentEncodedHost] isEqualToString:
              @"some.host.com"],
             @"percentEncodedHost is correct");
    passTest([[components percentEncodedUser] isEqualToString:
              @"user"],
             @"percentEncodedUser is correct");
    passTest([[components percentEncodedPassword] isEqualToString:
              @"password"],
             @"percentEncodedPassword is correct");

    // unencoded...
    passTest([[components query] isEqualToString:
              @"lang=en&response_type=code&uri=https://some.url.com/path?param1=one&param2=two"],
             @"query is correct");
    passTest([[components host] isEqualToString:
              @"some.host.com"],
             @"host is correct");
    passTest([[components user] isEqualToString:
              @"user"],
             @"user is correct");
    passTest([[components password] isEqualToString:
              @"password"],
             @"password is correct");
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
