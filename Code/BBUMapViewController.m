//
//  BBUMapViewController.m
//  Guide
//
//  Created by Boris Bügling on 21/03/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "BBULocationViewController.h"
#import "BBUMapViewController.h"
#import "BBUPlace.h"

@interface BBUMapViewController () <MKMapViewDelegate>

@property (nonatomic) MKMapView* mapView;

@end

#pragma mark -

@implementation BBUMapViewController

-(id)initWithPlace:(BBUPlace*)place {
    self = [self initWithPlaces:@[ place ]];
    if (self) {
        self.title = place.name;
    }
    return self;
}

-(id)initWithPlaces:(NSArray *)places {
    self = [super init];
    if (self) {
        self.places = places;
        self.title = NSLocalizedString(@"Places", nil);
    }
    return self;
}

-(void)setPlaces:(NSArray *)places {
    if (_places == places) {
        return;
    }
    
    _places = places;
    
    [self.mapView addAnnotations:self.places];
    [self.mapView setCenterCoordinate:[[self.places firstObject] coordinate] animated:YES];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    
    if (self.places.count == 0) {
        return;
    }
    
    [self.mapView addAnnotations:self.places];
    [self.mapView setCenterCoordinate:[[self.places firstObject] coordinate] animated:YES];
    
    if (self.places.count == 1) {
        [self.mapView setSelectedAnnotations:@[ [self.places firstObject] ]];
    }
}

#pragma mark - MKMapViewDelegate

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if (self.places.count == 1) {
        return;
    }
    
    BBULocationViewController* locationViewController = [[BBULocationViewController alloc] initWithPlace:view.annotation];
    [self.navigationController pushViewController:locationViewController animated:YES];
}

@end
