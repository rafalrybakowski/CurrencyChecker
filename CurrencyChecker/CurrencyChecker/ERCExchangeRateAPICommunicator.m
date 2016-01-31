//
//  ERCExchangeRateAPICommunicator.m
//  CurrencyChecker
//
//  Created by Rafał on 31.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "AFNetworking.h"
#import "ERCExchangeRateAPICommunicator.h"

@implementation ERCExchangeRateAPICommunicator

const NSString* API_ADDRESS = @"http://api.fixer.io/";

- (void)requestSingleCurrencyExchangeFrom:(NSString*)fromCurrencyCode to:(NSString*)targetCurrencyCode
{
    NSString* requestString = [NSString stringWithFormat:@"%@latest?base=%@&symbols=%@", API_ADDRESS, fromCurrencyCode, targetCurrencyCode];
    [self sendURLRequest:requestString];
}

- (void)requestSingleCurrencyExchangeFrom:(NSString*)fromCurrencyCode to:(NSString*)targetCurrencyCode forDate:(NSDate*)date
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString* dateString = [formatter stringFromDate:date];

    NSString* requestString = [NSString stringWithFormat:@"%@%@?base=%@&symbols=%@", API_ADDRESS, dateString, fromCurrencyCode, targetCurrencyCode];
    [self sendURLRequest:requestString];
}

- (void)sendURLRequest:(NSString*)requestString
{
    dispatch_async(dispatch_get_main_queue(), ^{
        AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
        [manager GET:requestString parameters:nil progress:nil success:^(NSURLSessionTask* task, id responseObject) {

            ERCExchange* exchange = [[ERCExchange alloc] init];
            exchange.base = [responseObject objectForKey:@"base"];
            exchange.date = [responseObject objectForKey:@"date"];
            exchange.rates = [responseObject objectForKey:@"rates"];

            if ([self.delegate respondsToSelector:@selector(ercExchangeRateAPICommunicator:didReceiveExchange:)]) {
                [self.delegate ercExchangeRateAPICommunicator:self didReceiveExchange:exchange];
            }
        }
            failure:^(NSURLSessionTask* operation, NSError* error) {
                NSLog(@"Error: %@", error);
            }];
    });
}

@end
