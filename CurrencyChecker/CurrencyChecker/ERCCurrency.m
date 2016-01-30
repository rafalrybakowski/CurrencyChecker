//
//  ERCCurrency.m
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "ERCCurrency.h"

@implementation ERCCurrency

- (id)initWithCode:(NSString*)code name:(NSString*)name symbol:(NSString*)symbol
{
    self = [super init];

    if (self) {
        self.code = code;
        self.name = name;
        self.symbol = symbol;

        self.isSelected = [[NSUserDefaults standardUserDefaults] boolForKey:[self getSaveSelectionStateKey]];
    }

    return self;
}

- (void)saveState
{
    [[NSUserDefaults standardUserDefaults] setBool:self.isSelected forKey:[self getSaveSelectionStateKey]];
}

- (NSString*)getSaveSelectionStateKey
{
    return [NSString stringWithFormat:@"%@ %@ %@ isSelected", self.code, self.name, self.symbol];
}

@end
