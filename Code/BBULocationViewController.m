//
//  BBULocationViewController.m
//  Guide
//
//  Created by Boris Bügling on 21/03/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import <ContentfulDeliveryAPI/ContentfulDeliveryAPI.h>
#import <ContentfulDeliveryAPI/UIImageView+CDAAsset.h>

#import "BBUAppStyle.h"
#import "BBULocationViewController.h"
#import "BBUMapViewController.h"
#import "BBUPlace.h"
#import "BBUWebViewController.h"
#import "UIView+Geometry.h"

@interface BBULocationViewController ()

@property (nonatomic) BBUPlace* place;

@end

#pragma mark -

@implementation BBULocationViewController

-(id)initWithPlace:(BBUPlace *)place {
    self = [super init];
    if (self) {
        self.place = place;
        self.title = self.place.name;
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [BBUAppStyle backgroundColor];
    
    UIScrollView* contentScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:contentScrollView];
    
    UIScrollView* pictureScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 10.0, self.view.width, 250.0)];
    [contentScrollView addSubview:pictureScrollView];
    
    __block CGFloat xCoordinate = 10.0;
    [self.place fetchPictureAssetsWithCompletionBlock:^(NSArray *assets, NSError *error) {
        for (CDAAsset* asset in assets) {
            UIImageView* pictureImageView = [[UIImageView alloc] initWithFrame:CGRectMake(xCoordinate, 0.0, 250.0, 250.0)];
            pictureImageView.contentMode = UIViewContentModeScaleAspectFit;
            
            [pictureImageView cda_setImageWithAsset:asset];
            [pictureScrollView addSubview:pictureImageView];
            
            xCoordinate = CGRectGetMaxX(pictureImageView.frame) + 10.0;
        }
        
        pictureScrollView.contentSize = CGSizeMake(pictureScrollView.width, xCoordinate);
    }];
    
    UILabel* descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, CGRectGetMaxY(pictureScrollView.frame) + 10.0, self.view.width - 20.0, 500.0)];
    descriptionLabel.font = [BBUAppStyle labelFont];
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.text = self.place.placeDescription;
    [descriptionLabel sizeToFit];
    [contentScrollView addSubview:descriptionLabel];
    
    UIButton* addressButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addressButton.frame = CGRectMake(40.0, CGRectGetMaxY(descriptionLabel.frame) + 25.0, 44.0, 44.0);
    [addressButton addTarget:self
                      action:@selector(mapTapped)
            forControlEvents:UIControlEventTouchUpInside];
    [addressButton setImage:[UIImage imageNamed:@"map"] forState:UIControlStateNormal];
    [contentScrollView addSubview:addressButton];
    addressButton.enabled = self.place.address.latitude != 0 && self.place.address.longitude != 0;
    
    UIButton* phoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    phoneButton.frame = CGRectMake(CGRectGetMaxX(addressButton.frame) + 10.0, addressButton.y,
                                   addressButton.width, addressButton.height);
    [phoneButton addTarget:self
                      action:@selector(phoneTapped)
            forControlEvents:UIControlEventTouchUpInside];
    [phoneButton setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
    [contentScrollView addSubview:phoneButton];
    phoneButton.enabled = self.place.phoneNumber.length > 0;
    
    UIButton* emailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    emailButton.frame = CGRectMake(CGRectGetMaxX(phoneButton.frame) + 10.0, addressButton.y,
                                   addressButton.width, addressButton.height);
    [emailButton addTarget:self
                    action:@selector(emailTapped)
          forControlEvents:UIControlEventTouchUpInside];
    [emailButton setImage:[UIImage imageNamed:@"email"] forState:UIControlStateNormal];
    [contentScrollView addSubview:emailButton];
    emailButton.enabled = self.place.email.length > 0;
    
    UIButton* urlButton = [UIButton buttonWithType:UIButtonTypeCustom];
    urlButton.frame = CGRectMake(CGRectGetMaxX(emailButton.frame) + 10.0, addressButton.y,
                                   addressButton.width, addressButton.height);
    [urlButton addTarget:self
                    action:@selector(urlTapped)
          forControlEvents:UIControlEventTouchUpInside];
    [urlButton setImage:[UIImage imageNamed:@"link"] forState:UIControlStateNormal];
    [contentScrollView addSubview:urlButton];
    urlButton.enabled = self.place.URL != nil;
    
    NSMutableAttributedString* openingTimes = [NSMutableAttributedString new];
    [openingTimes appendAttributedString:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Opening Times\n\n", nil) attributes:@{ NSFontAttributeName: [BBUAppStyle boldLabelFont] }]];
    [openingTimes appendAttributedString:[[NSAttributedString alloc] initWithString:self.place.openingTimes attributes:@{ NSFontAttributeName: [BBUAppStyle labelFont] }]];
    
    UILabel* openingTimesLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, CGRectGetMaxY(addressButton.frame) + 20.0, self.view.width - 20.0, 500.0)];
    openingTimesLabel.numberOfLines = 0;
    openingTimesLabel.attributedText = openingTimes;
    [openingTimesLabel sizeToFit];
    [contentScrollView addSubview:openingTimesLabel];
    
    contentScrollView.contentSize = CGSizeMake(contentScrollView.width,
                                               CGRectGetMaxY(openingTimesLabel.frame) + 10.0);
}

#pragma mark - Actions

-(void)emailTapped {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"mailto://" stringByAppendingString:self.place.phoneNumber]]];
}

-(void)mapTapped {
    BBUMapViewController* mapViewController = [[BBUMapViewController alloc] initWithPlace:self.place];
    [self.navigationController pushViewController:mapViewController animated:YES];
}

-(void)phoneTapped {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tel://" stringByAppendingString:self.place.phoneNumber]]];
}

-(void)urlTapped {
    BBUWebViewController* webViewController = [[BBUWebViewController alloc] initWithURL:self.place.URL];
    [self.navigationController pushViewController:webViewController animated:YES];
}

@end
