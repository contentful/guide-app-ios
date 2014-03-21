//
//  BBUMapViewController.m
//  Guide
//
//  Created by Boris Bügling on 21/03/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "BBUMapViewController.h"
#import "BBUPlace.h"

@interface BBUMapViewController ()

@property (nonatomic) MKMapView* mapView;
@property (nonatomic) BBUPlace* place;

@end

#pragma mark -

@implementation BBUMapViewController

-(id)initWithPlace:(BBUPlace*)place {
    self = [super init];
    if (self) {
        self.place = place;
        self.title = self.place.name;
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.mapView];
    
    [self.mapView addAnnotation:self.place];
    [self.mapView setCenterCoordinate:self.place.coordinate animated:YES];
    [self.mapView setSelectedAnnotations:@[ self.place ]];
}

@end
