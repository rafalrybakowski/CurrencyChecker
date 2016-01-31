//
//  ERCExchangerViewController.m
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initializeHorizontalPickers];
}

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
    [self.fromCurrencyHorizontalPicker setPickerStyleToFlat];
    [self.fromCurrencyHorizontalPicker setInterItemSpacing:10];
    self.fromCurrencyHorizontalPicker.delegate = self;
    [self.fromCurrencyHorizontalPicker selectItem:0 withAnimation:false notifySelection:false];

    [self.targetCurrencyHorizontalPicker initWithItemList:currencyCodeArray];
    [self.targetCurrencyHorizontalPicker setPickerStyleToFlat];
    [self.targetCurrencyHorizontalPicker setInterItemSpacing:10];
    self.targetCurrencyHorizontalPicker.delegate = self;
    [self.targetCurrencyHorizontalPicker selectItem:0 withAnimation:false notifySelection:false];
}

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

    NSNumber* exchangeRate = exchange.rates[[NSString stringWithFormat:@"%@", self.targetCurrencyCode]];
    if (exchangeRate == nil) {
        exchangeRate = [NSNumber numberWithInt:1];
    }
    
    self.exchangeRateLabel.text = [NSString stringWithFormat:@"%.03f", exchangeRate.floatValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
