//
//  ERCCurrency.m
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "ERCCurrency.h"

@implementation ERCCurrency

- (id)initWithCode:(NSString*)code name:(NSString*)name
{
    self = [super init];

    if (self) {
        self.code = code;
        self.name = name;
    }

    return self;
}

@end
