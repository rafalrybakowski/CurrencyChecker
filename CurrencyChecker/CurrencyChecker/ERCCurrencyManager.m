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
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.fixer.io/latest?base=PLN&symbols=GBP,USD" parameters:nil progress:nil success:^(NSURLSessionTask* task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    }
        failure:^(NSURLSessionTask* operation, NSError* error) {
            NSLog(@"Error: %@", error);
        }];

    return nil;
}

@end
