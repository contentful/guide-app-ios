//
//  BBULocationPicturesViewController.m
//  Guide
//
//  Created by Boris Bügling on 21/03/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import <ContentfulDeliveryAPI/ContentfulDeliveryAPI.h>
#import <PDKTCollectionViewWaterfallLayout/PDKTCollectionViewWaterfallLayout.h>

#import "BBUAppStyle.h"
#import "BBULocationPicturesViewController.h"
#import "CDAClient+Guide.h"

@interface BBULocationPicturesViewController () <PDKTCollectionViewWaterfallLayoutDelegate>

@end

#pragma mark -

@implementation BBULocationPicturesViewController

-(id)init {
    PDKTCollectionViewWaterfallLayout* layout = [PDKTCollectionViewWaterfallLayout new];
    layout.delegate = self;
    
    self = [super initWithCollectionViewLayout:layout cellMapping:@{ @"imageURL": @"URL" }];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"picture_small"];
        self.title = NSLocalizedString(@"Pictures", nil);
        
        self.client = [CDAClient sharedClient];
        self.resourceType = CDAResourceTypeAsset;
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [BBUAppStyle backgroundColor];
}

#pragma mark - PDKTCollectionViewWaterfallLayoutDelegate

-(CGFloat)collectionView:(UICollectionView *)collectionView
                  layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout
 aspectRatioForIndexPath:(NSIndexPath *)indexPath {
    CDAAsset* asset = self.items[indexPath.row];
    return asset.size.width / asset.size.height;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView
                  layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout
   heightItemAtIndexPath:(NSIndexPath *)indexPath {
    CDAAsset* asset = self.items[indexPath.row];
    return asset.size.height;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView
                  layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout
    itemSpacingInSection:(NSUInteger)section {
    return 10.0;
}

-(NSUInteger)collectionView:(UICollectionView *)collectionView
                     layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout
   numberOfColumnsInSection:(NSUInteger)section {
    return 3;
}

@end
