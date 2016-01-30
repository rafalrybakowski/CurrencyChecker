//
//  ERCCurrency.h
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ERCCurrency : NSObject

@property NSString* code;
@property NSString* name;
@property NSString* symbol;
@property bool isSelected;

- (id)initWithCode:(NSString*)code name:(NSString*)name symbol:(NSString*)symbol;
- (void)saveState;

@end
