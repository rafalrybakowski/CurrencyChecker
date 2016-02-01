//
//  ERCExchangerViewController.m
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "Constants.h"
#import "CurrencyChecker-Swift.h"
#import "ERCCurrencyManager.h"
#import "ERCExchangeManager.h"
#import "ERCExchangerViewController.h"

@interface ERCExchangerViewController () <ERCExchangeManagerDelegate>

@property ERCCurrencyManager* currencyManager;
@property ERCExchangeManager* exchangeManager;

@property NSString* fromCurrencyCode;
@property NSString* targetCurrencyCode;

@end

@implementation ERCExchangerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.currencyManager = [ERCCurrencyManager sharedInstance];
    self.exchangeManager = [ERCExchangeManager sharedInstance];
    self.exchangeManager.delegate = self;

    self.view.backgroundColor = [UIColor getColorFromHex:COLOR_HEX_DARK_GRAY];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initializeHorizontalPickers];
}

#pragma mark - Interface configuration

- (void)initializeHorizontalPickers
{
    NSArray* selectedCurrenciesArray = [self.currencyManager getAllSelectedCurrencies];
    NSMutableArray* currencyCodeArray = [[NSMutableArray alloc] init];
    for (ERCCurrency* currency in selectedCurrenciesArray) {
        [currencyCodeArray addObject:currency.code];
    }

    if (currencyCodeArray.count == 0) {
        currencyCodeArray = (NSMutableArray*)@[ @"PLN", @"USD", @"GBP" ];
    }

    [self.fromCurrencyHorizontalPicker initWithItemList:currencyCodeArray];
    [self setDefaultAppearanceForHorizontalPicker:self.fromCurrencyHorizontalPicker];
    self.fromCurrencyHorizontalPicker.delegate = self;
    [self.fromCurrencyHorizontalPicker selectItem:0 withAnimation:false notifySelection:false];

    [self.targetCurrencyHorizontalPicker initWithItemList:currencyCodeArray];
    [self setDefaultAppearanceForHorizontalPicker:self.targetCurrencyHorizontalPicker];
    self.targetCurrencyHorizontalPicker.delegate = self;
    [self.targetCurrencyHorizontalPicker selectItem:0 withAnimation:false notifySelection:false];
}

- (void)setDefaultAppearanceForHorizontalPicker:(ERCTextHorizontalPicker*)horizontalPicker
{
    UIFont* fontUnselectedCurrency = [UIFont fontWithName:@"CoreSansD25Light" size:30];
    UIFont* fontSelectedCurrency = [UIFont fontWithName:@"CoreSansD35Regular" size:30];

    [horizontalPicker setPickerStyleToFlat];
    [horizontalPicker setInterItemSpacing:10];
    [horizontalPicker setFont:fontUnselectedCurrency];
    [horizontalPicker setHighlightedFont:fontSelectedCurrency];
    [horizontalPicker setTextColor:[UIColor getColorFromHex:COLOR_HEX_LIGHT_GRAY]];
    [horizontalPicker setHighlightedTextColor:[UIColor getColorFromHex:COLOR_HEX_ACTIVE_GREEN]];
}

#pragma mark - Delegate methods

- (void)textHorizontalPicker:(UIView*)textHorizontalPicker itemChanged:(NSString*)selectedItem atIndex:(NSInteger)index
{
    self.fromCurrencyCode = [self.fromCurrencyHorizontalPicker selectedItem];
    self.targetCurrencyCode = [self.targetCurrencyHorizontalPicker selectedItem];

    [self.exchangeManager requestSingleCurrencyExchangeFrom:self.fromCurrencyCode to:self.targetCurrencyCode];
}

- (void)ercExchangeManager:(ERCExchangeManager*)exchangeManager didReceiveExchange:(ERCExchange*)exchange
{
    ERCCurrency* fromCurrency = [self.currencyManager getCurrencyWithCode:self.fromCurrencyCode];
    ERCCurrency* targetCurrency = [self.currencyManager getCurrencyWithCode:self.targetCurrencyCode];

    self.fromCurrencySymbolLabel.text = [NSString stringWithFormat:@"1%@=", fromCurrency.symbol];
    self.targetCurrencySymbolLabel.text = targetCurrency.symbol;

    NSNumber* exchangeRate = exchange.rates[[NSString stringWithFormat:@"%@", self.targetCurrencyCode]];
    if (exchangeRate == nil) {
        exchangeRate = [NSNumber numberWithInt:1];
    }

    self.exchangeRateLabel.text = [NSString stringWithFormat:[self getExchangeRateDisplayFormat:exchangeRate], exchangeRate.floatValue];
}

#pragma mark - supplementary methods

- (NSString*)getExchangeRateDisplayFormat:(NSNumber*)rate
{
    if ([rate floatValue] >= 10) {
        return @"%.02f";
    }
    else {
        return @"%.03f";
    }
}

@end
