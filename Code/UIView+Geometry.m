//
//  UIView+Geometry.m
//  Guide
//
//  Created by Boris Bügling on 21/03/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import "UIView+Geometry.h"

@implementation UIView (Geometry)

-(CGFloat)height {
    return self.size.height;
}

-(CGPoint)origin {
    return self.frame.origin;
}

-(CGSize)size {
    return self.frame.size;
}

-(CGFloat)width {
    return self.size.width;
}

-(CGFloat)x {
    return self.origin.x;
}

-(CGFloat)y {
    return self.origin.y;
}

#pragma mark -

-(void)setHeight:(CGFloat)height {
    self.frame = CGRectMake(self.x, self.y, self.width, height);
}

-(void)setOrigin:(CGPoint)origin {
    self.frame = CGRectMake(origin.x, origin.y, self.width, self.height);
}

-(void)setSize:(CGSize)size {
    self.frame = CGRectMake(self.origin.x, self.origin.y, size.width, size.height);
}

-(void)setWidth:(CGFloat)width {
    self.frame = CGRectMake(self.x, self.y, width, self.height);
}

-(void)setX:(CGFloat)x {
    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

-(void)setY:(CGFloat)y {
    self.frame = CGRectMake(self.x, y, self.width, self.height);
}

@end
