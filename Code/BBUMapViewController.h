//
//  BBUMapViewController.h
//  Guide
//
//  Created by Boris Bügling on 21/03/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BBUPlace;

@interface BBUMapViewController : UIViewController

@property (nonatomic) NSArray* places;

-(id)initWithPlace:(BBUPlace*)place;
-(id)initWithPlaces:(NSArray*)places;

@end
