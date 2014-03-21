//
//  CDAClient+Guide.m
//  Guide
//
//  Created by Boris Bügling on 21/03/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import "BBUPlace.h"
#import "CDAClient+Guide.h"

@implementation CDAClient (Guide)

+(instancetype)sharedClient {
    static dispatch_once_t once;
    static CDAClient *sharedClient;
    dispatch_once(&once, ^ {
        sharedClient = [[self alloc] initWithSpaceKey:@"nhkrrfkqkvcv" accessToken:@"4c1379f8fa28be7025968c1163b13e23ded85d5747c06f9634abd9724a70fd17"];
        
        [sharedClient registerClass:[BBUPlace class] forContentTypeWithIdentifier:@"3hEsRfcKgMGSaiocGQaqCo"];
    });
    return sharedClient;
}

@end
