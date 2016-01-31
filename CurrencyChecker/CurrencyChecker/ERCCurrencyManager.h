//
//  ERCCurrencyManager.h
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "ERCCurrency.h"
#import <Foundation/Foundation.h>

@interface ERCCurrencyManager : NSObject

@property NSArray* currencies;

+ (ERCCurrencyManager*)sharedInstance;

- (NSArray*)getAllSelectedCurrencies;
- (ERCCurrency*)getCurrencyWithCode:(NSString*)code;

@end
