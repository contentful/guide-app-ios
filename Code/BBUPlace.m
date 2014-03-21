//
//  BBUPlace.m
//  Guide
//
//  Created by Boris Bügling on 21/03/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import "BBUPlace.h"
#import "CDAClient+Guide.h"

@implementation BBUPlace

-(CLLocationCoordinate2D)address {
    return [self CLLocationCoordinate2DFromFieldWithIdentifier:@"address"];
}

-(CLLocationCoordinate2D)coordinate {
    return self.address;
}

-(NSString *)email {
    return self.fields[@"email"];
}

-(void)fetchPictureAssetsWithCompletionBlock:(void (^)(NSArray* assets, NSError* error))completionBlock {
    [[CDAClient sharedClient] resolveLinksFromArray:self.fields[@"pictures"]
                                            success:^(NSArray *items) {
                                                if (completionBlock) {
                                                    completionBlock(items, nil);
                                                }
                                            } failure:^(CDAResponse *response, NSError *error) {
                                                if (completionBlock) {
                                                    completionBlock(nil, error);
                                                }
                                            }];
}

-(NSString *)name {
    return self.fields[@"name"];
}

-(NSString *)phoneNumber {
    return self.fields[@"phoneNumber"];
}

-(NSString *)placeDescription {
    return  self.fields[@"description"];
}

-(NSUInteger)rating {
    return [self.fields[@"rating"] unsignedIntegerValue];
}

-(NSString *)subtitle {
    return self.type;
}

-(NSString *)title {
    return self.name;
}

-(NSString *)type {
    return self.fields[@"type"];
}

-(NSURL *)URL {
    return self.fields[@"url"] ? [NSURL URLWithString:self.fields[@"url"]] : nil;
}

@end
