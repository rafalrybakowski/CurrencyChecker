//
//  ERCExchangeRateAPICommunicator.h
//  CurrencyChecker
//
//  Created by Rafał on 31.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "ERCExchange.h"
#import <Foundation/Foundation.h>

@protocol ERCExchangeRateAPICommunicatorDelegate;

@interface ERCExchangeRateAPICommunicator : NSObject

@property (weak, nonatomic) id<ERCExchangeRateAPICommunicatorDelegate> delegate;

- (void)requestSingleCurrencyExchangeFrom:(NSString*)fromCurrencyCode to:(NSString*)targetCurrencyCode;
- (void)requestSingleCurrencyExchangeFrom:(NSString*)fromCurrencyCode to:(NSString*)targetCurrencyCode forDate:(NSDate*)date;

@end

@protocol ERCExchangeRateAPICommunicatorDelegate <NSObject>

@optional
- (void)ercExchangeRateAPICommunicator:(ERCExchangeRateAPICommunicator*)apiCommunicator didReceiveExchange:(ERCExchange*)exchange;

@end