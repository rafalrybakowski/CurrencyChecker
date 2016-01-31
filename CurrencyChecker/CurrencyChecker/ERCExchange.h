//
//  ERCExchange.h
//  CurrencyChecker
//
//  Created by Rafał on 31.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ERCExchange : NSObject

@property (assign, nonatomic) NSString* base;
@property (assign, nonatomic) NSDate* date;
@property (assign, nonatomic) NSDictionary* rates;

@end
