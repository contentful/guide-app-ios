//
//  BBUWebViewController.m
//  Guide
//
//  Created by Boris Bügling on 21/03/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

#import "BBUAppStyle.h"
#import "BBUWebViewController.h"

@interface BBUWebViewController () <UIWebViewDelegate>

@property (nonatomic) NSURL* URL;

@end

#pragma mark -

@implementation BBUWebViewController

-(id)initWithURL:(NSURL*)URL {
    self = [super init];
    if (self) {
        self.URL = URL;
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [BBUAppStyle backgroundColor];
    
    UIWebView* webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    [webView loadRequest:[NSURLRequest requestWithURL:self.URL]];
}

#pragma mark -

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

@end
