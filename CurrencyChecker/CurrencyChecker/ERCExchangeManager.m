//
//  ERCExchangeManager.m
//  CurrencyChecker
//
//  Created by Rafał on 31.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "ERCExchangeManager.h"
#import "ERCExchangeRateAPICommunicator.h"

@interface ERCExchangeManager () <ERCExchangeRateAPICommunicatorDelegate>

@property ERCExchangeRateAPICommunicator* exchangeApiCommunicator;

@end

@implementation ERCExchangeManager

+ (ERCExchangeManager*)sharedInstance
{
    static dispatch_once_t oncePredicate;
    static ERCExchangeManager* _sharedInstance = nil;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[ERCExchangeManager alloc] init];
    });
    return _sharedInstance;
}

- (id)init
{
    self = [super init];

    if (self) {
        self.exchangeApiCommunicator = [[ERCExchangeRateAPICommunicator alloc] init];
        self.exchangeApiCommunicator.delegate = self;
    }

    return self;
}

- (void)requestSingleCurrencyExchangeFrom:(NSString*)fromCurrencyCode to:(NSString*)targetCurrencyCode
{
    [self.exchangeApiCommunicator requestSingleCurrencyExchangeFrom:fromCurrencyCode to:targetCurrencyCode];
}

- (void)requestSingleCurrencyExchangeFrom:(NSString*)fromCurrencyCode to:(NSString*)targetCurrencyCode forDate:(NSDate*)date
{
    [self.exchangeApiCommunicator requestSingleCurrencyExchangeFrom:fromCurrencyCode to:targetCurrencyCode forDate:date];
}

- (void)getExchangeRatesForLastMonthFrom:(NSString*)fromCurrencyCode to:(NSString*)targetCurrencyCode
{
}

- (void)ercExchangeRateAPICommunicator:(ERCExchangeRateAPICommunicator*)apiCommunicator didReceiveExchange:(ERCExchange*)exchange
{
    if ([self.delegate respondsToSelector:@selector(ercExchangeManager:didReceiveExchange:)]) {
        [self.delegate ercExchangeManager:self didReceiveExchange:exchange];
    }
}

@end
