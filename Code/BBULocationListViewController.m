//
//  BBULocationListViewController.m
//  Guide
//
//  Created by Boris Bügling on 21/03/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import <CPDAcknowledgements/CPDAcknowledgementsViewController.h>

#import "BBUAppStyle.h"
#import "BBULocationListViewController.h"
#import "BBULocationViewController.h"
#import "BBUPlace.h"
#import "CDAClient+Guide.h"
#import "UIView+Geometry.h"

@interface BBULocationListViewController () <CDAEntriesViewControllerDelegate>

@end

#pragma mark -

@implementation BBULocationListViewController

-(id)init {
    self = [super initWithCellMapping:@{ @"textLabel.text": @"fields.name",
                                         @"detailTextLabel.text": @"fields.type" }];
    if (self) {
        self.client = [CDAClient sharedClient];
        self.query = @{ @"content_type": @"3hEsRfcKgMGSaiocGQaqCo" };
        self.title = NSLocalizedString(@"Places", nil);
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"thanks_small"] style:UIBarButtonItemStyleBordered target:self action:@selector(thanksTapped)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"contentful_logo_small"]]];
        self.tabBarItem.image = [UIImage imageNamed:@"coffeecup_small"];
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [BBUAppStyle backgroundColor];
    self.tableView.separatorColor = [UIColor blackColor];
}

#pragma mark - Actions

-(void)dismissAcknowledgements {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)thanksTapped {
    CPDAcknowledgementsViewController* acknowledgementsViewController = [[CPDAcknowledgementsViewController alloc] initWithStyle:nil];
    acknowledgementsViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissAcknowledgements)];
    
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:acknowledgementsViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark - CDAEntriesViewControllerDelegate

-(void)entriesViewController:(CDAEntriesViewController *)entriesViewController
       didSelectRowWithEntry:(CDAEntry *)entry {
    BBULocationViewController* locationViewController = [[BBULocationViewController alloc] initWithPlace:(BBUPlace*)entry];
    [self.navigationController pushViewController:locationViewController animated:YES];
}

#pragma mark - UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [BBUAppStyle backgroundColor];
    cell.detailTextLabel.font = [BBUAppStyle labelFont];
    cell.textLabel.font = [BBUAppStyle boldLabelFont];
    
    UILabel* ratingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 80.0, cell.height)];
    ratingLabel.font = [UIFont systemFontOfSize:12.0];
    ratingLabel.textAlignment = NSTextAlignmentRight;
    
    BBUPlace* place = self.items[indexPath.row];
    
    NSMutableString* ratingText = [@"" mutableCopy];
    for (NSUInteger i = 0; i < place.rating; i++) {
        [ratingText appendString:@"👍"];
    }
    
    ratingLabel.text = ratingText;
    
    cell.accessoryView = ratingLabel;
    return cell;
}

@end
