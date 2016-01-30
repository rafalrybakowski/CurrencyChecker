//
//  ERCExchangerViewController.m
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "ERCCurrencyManager.h"
#import "ERCExchangerViewController.h"

@interface ERCExchangerViewController ()

@property ERCCurrencyManager* currencyManager;

@end

@implementation ERCExchangerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.currencyManager = [ERCCurrencyManager sharedInstance];

    // Do any additional setup after loading the view.

    //    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    //    [manager GET:@"http://api.fixer.io/latest?base=PLN&symbols=GBP,USD" parameters:nil progress:nil success:^(NSURLSessionTask* task, id responseObject) {
    //        NSLog(@"JSON: %@", responseObject);
    //    }
    //         failure:^(NSURLSessionTask* operation, NSError* error) {
    //             NSLog(@"Error: %@", error);
    //         }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
