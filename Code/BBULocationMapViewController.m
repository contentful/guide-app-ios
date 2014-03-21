//
//  BBULocationMapViewController.m
//  Guide
//
//  Created by Boris Bügling on 21/03/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import <ContentfulDeliveryAPI/ContentfulDeliveryAPI.h>

#import "BBULocationMapViewController.h"
#import "CDAClient+Guide.h"

@implementation BBULocationMapViewController

-(id)init {
    self = [super initWithPlaces:nil];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"map_small"];
        self.title = NSLocalizedString(@"Map", nil);
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [[CDAClient sharedClient] fetchEntriesMatching:@{ @"content_type": @"3hEsRfcKgMGSaiocGQaqCo" }
                                           success:^(CDAResponse *response, CDAArray *array) {
                                               self.places = array.items;
                                           } failure:nil];
}

@end
