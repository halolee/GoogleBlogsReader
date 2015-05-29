//
//  DetailViewController.m
//  GoogleBlogsReader
//
//  Created by Hao Li on 29/05/2015.
//  Copyright (c) 2015 halolee. All rights reserved.
//

#import "DetailViewController.h"

#define TimeOutValue 30.0

@interface DetailViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(Entry *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = @"Preparing for detail view content.";
        if (!self.webView) {
            self.webView = [[UIWebView alloc] initWithFrame:CGRectOffset(self.view.frame, 0.0, 0.0)];
            self.webView.delegate = self;
            
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL: [NSURL URLWithString:self.detailItem.url] cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: TimeOutValue];
            [self.webView loadRequest: request];
            
            [self.view addSubview:self.webView];
            self.webView.hidden = YES;
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma marks - Progress View Delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    self.detailDescriptionLabel.text = @"Loading web content ...";
    self.webView.hidden = YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.detailDescriptionLabel.text = @"Web contnet loaded";
    self.webView.hidden = NO;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

@end
