//
//  ERCExchangeManager.h
//  CurrencyChecker
//
//  Created by Rafał on 31.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "ERCExchange.h"
#import <Foundation/Foundation.h>

@protocol ERCExchangeManagerDelegate;

@interface ERCExchangeManager : NSObject

+ (ERCExchangeManager*)sharedInstance;

@property (weak, nonatomic) id<ERCExchangeManagerDelegate> delegate;

- (void)requestSingleCurrencyExchangeFrom:(NSString*)fromCurrencyCode to:(NSString*)targetCurrencyCode;
- (void)requestSingleCurrencyExchangeFrom:(NSString*)fromCurrencyCode to:(NSString*)targetCurrencyCode forDate:(NSDate*)date;
- (void)getExchangeRatesForLastMonthFrom:(NSString*)fromCurrencyCode to:(NSString*)targetCurrencyCode;

@end

@protocol ERCExchangeManagerDelegate <NSObject>

@optional
- (void)ercExchangeManager:(ERCExchangeManager*)exchangeManager didReceiveExchange:(ERCExchange*)exchange;

@end
