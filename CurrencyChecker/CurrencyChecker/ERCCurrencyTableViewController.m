//
//  ERCCurrencyTableViewController.m
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "Constants.h"
#import "CurrencyChecker-Swift.h"
#import "ERCCurrency.h"
#import "ERCCurrencyManager.h"
#import "ERCCurrencyTableViewController.h"
#import "ERCExchangeManager.h"

@interface ERCCurrencyTableViewController ()

@property ERCCurrencyManager* currencyManager;
@property ERCExchangeManager* exchangeManager;

@end

@implementation ERCCurrencyTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.currencyManager = [ERCCurrencyManager sharedInstance];
    self.exchangeManager = [ERCExchangeManager sharedInstance];

    self.view.backgroundColor = [UIColor getColorFromHex:COLOR_HEX_DARK_GRAY];
}

#pragma mark - Tableview methods

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.currencyManager.currencies.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* CellIdentifier = @"ERCCurrencyDisplayCell";
    ERCCurrencyDisplayCell* currencyCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (currencyCell == nil) {
        currencyCell = [[ERCCurrencyDisplayCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    currencyCell.backgroundColor = [UIColor clearColor];

    ERCCurrency* currency = self.currencyManager.currencies[indexPath.row];
    currencyCell.nameLabel.text = currency.name;
    currencyCell.codeLabel.text = currency.code;
    currencyCell.symbolLabel.text = currency.symbol;
    [currencyCell.selectionSwitch setOn:currency.isSelected];
    currencyCell.delegate = self;

    return currencyCell;
}

#pragma mark - Delegate methods

- (void)ERCCurrencyDisplayCell:(ERCCurrencyDisplayCell*)currencyDisplayCell flippedSwitchToState:(bool)state
{
    ERCCurrency* currency = [self.currencyManager getCurrencyWithCode:currencyDisplayCell.codeLabel.text];
    if (currency) {
        currency.isSelected = state;
        [currency saveState];
    }
}

@end
