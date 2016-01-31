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
    [UINavigationBar appearance].barTintColor = [UIColor getColorFromHex:COLOR_HEX_DARK_GRAY];
    [UINavigationBar appearance].tintColor = [UIColor getColorFromHex:COLOR_HEX_PALE_GREEN];
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor getColorFromHex:COLOR_HEX_PALE_GREEN] }];
}

@end
