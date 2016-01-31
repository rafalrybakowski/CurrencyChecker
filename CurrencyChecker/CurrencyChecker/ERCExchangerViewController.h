//
//  ERCExchangerViewController.h
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "ERCTextHorizontalPicker.h"
#import <UIKit/UIKit.h>

@interface ERCExchangerViewController : UIViewController <ERCTextHorizontalPickerDelegate>

@property (weak, nonatomic) IBOutlet ERCTextHorizontalPicker* fromCurrencyHorizontalPicker;
@property (weak, nonatomic) IBOutlet ERCTextHorizontalPicker* targetCurrencyHorizontalPicker;

@property (weak, nonatomic) IBOutlet UILabel* exchangeRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromCurrencySymbolLabel;
@property (weak, nonatomic) IBOutlet UILabel *targetCurrencySymbolLabel;

@end
