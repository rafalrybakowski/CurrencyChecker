//
//  ERCNavigationController.m
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "Constants.h"
#import "CurrencyChecker-Swift.h"
#import "ERCNavigationController.h"

@implementation ERCNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].tintColor = [UIColor getColorFromHex:COLOR_HEX_ACTIVE_GREEN];
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor getColorFromHex:COLOR_HEX_ACTIVE_GREEN], NSFontAttributeName : [UIFont fontWithName:@"CoreSansD55Bold" size:20] }];
//    [UINavigationBar appearance].barTintColor = [UIColor getColorFromHex:COLOR_HEX_DARK_GRAY];
}

@end
