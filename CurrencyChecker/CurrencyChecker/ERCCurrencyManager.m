//
//  ERCCurrencyManager.m
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "AFNetworking.h"

#import "ERCCurrencyManager.h"

@implementation ERCCurrencyManager

+ (ERCCurrencyManager*)sharedInstance
{
    static dispatch_once_t oncePredicate;
    static ERCCurrencyManager* _sharedInstance = nil;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[ERCCurrencyManager alloc] init];
    });
    return _sharedInstance;
}

- (id)init
{
    self = [super init];

    if (self) {
        self.currencies = [self getAllCurrencies];
    }

    return self;
}

- (NSArray*)getAllCurrencies
{
    NSString* jsonPath = [[NSBundle mainBundle] pathForResource:@"currencies" ofType:@"txt"];
    NSData* json = [[NSData alloc] initWithContentsOfFile:jsonPath];

    NSDictionary* parsedJSON = [NSJSONSerialization JSONObjectWithData:json options:0 error:nil];
    NSDictionary* dictionaryCourrencies = [parsedJSON valueForKey:@"currencies"];
    NSArray* sortedCodes = [[dictionaryCourrencies allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];

    NSMutableArray* arrayCurrencies = [[NSMutableArray alloc] init];
    for (NSString* currencyCode in sortedCodes) {
        NSArray* currencyDetails = [dictionaryCourrencies objectForKey:currencyCode];
        NSString* currencyName = currencyDetails[0];
        NSString* currencySymbol = currencyDetails[1];

        ERCCurrency* currency = [[ERCCurrency alloc] initWithCode:currencyCode name:currencyName symbol:currencySymbol];
        [arrayCurrencies addObject:currency];
    }

    return arrayCurrencies;
}

- (NSArray*)getAllSelectedCurrencies
{
    NSMutableArray* currencyArray = [[NSMutableArray alloc] init];

    for (ERCCurrency* currency in self.currencies) {
        if (currency.isSelected) {
            [currencyArray addObject:currency];
        }
    }

    return currencyArray;
}

- (ERCCurrency*)getCurrencyWithCode:(NSString*)code
{
    for (ERCCurrency* currency in self.currencies) {
        if ([currency.code isEqualToString:code]) {
            return currency;
        }
    }

    return nil;
}

@end
