//
//  BBUPlace.h
//  Guide
//
//  Created by Boris Bügling on 21/03/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import "CDAEntry.h"

@interface BBUPlace : CDAEntry <MKAnnotation>

@property (readonly) CLLocationCoordinate2D address;
@property (readonly) NSString* email;
@property (readonly) NSString* name;
@property (readonly) NSString* openingTimes;
@property (readonly) NSString* phoneNumber;
@property (readonly) NSString* placeDescription;
@property (readonly) NSUInteger rating;
@property (readonly) NSString* type;
@property (readonly) NSURL* URL;

-(void)fetchPictureAssetsWithCompletionBlock:(void (^)(NSArray* assets, NSError* error))completionBlock;

@end
