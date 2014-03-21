//
//  BBUAppStyle.m
//  Guide
//
//  Created by Boris Bügling on 21/03/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import "BBUAppStyle.h"

#define UIColorFromRGB(r, g, b) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:1.0]

@implementation BBUAppStyle

+(UIColor *)backgroundColor {
    return UIColorFromRGB(0xE4, 0xDD, 0xCA);
}

+(UIFont *)boldLabelFont {
    return [UIFont fontWithName:@"AvenirNext-Heavy" size:[UIFont systemFontSize]];
}

+(void)initAppearance {
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0xD6, 0xCE, 0xC3)];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-Heavy" size:18.0] }];
    
    [[UITabBar appearance] setBarTintColor:UIColorFromRGB(0xD6, 0xCE, 0xC3)];
    [[UITabBar appearance] setTintColor:[UIColor blackColor]];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{ NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-Regular" size:16.0] } forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-Regular" size:14.0], NSForegroundColorAttributeName: [UIColor blackColor] } forState:UIControlStateNormal];
}

+(UIFont *)labelFont {
    return [UIFont fontWithName:@"AvenirNext-Regular" size:[UIFont systemFontSize]];
}

@end
