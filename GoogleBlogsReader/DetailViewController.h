//
//  DetailViewController.h
//  GoogleBlogsReader
//
//  Created by Hao Li on 29/05/2015.
//  Copyright (c) 2015 halolee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
