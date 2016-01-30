//
//  ERCCurrencyDisplayCell.h
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ERCCurrencyDisplayCellDelegate;

@interface ERCCurrencyDisplayCell : UITableViewCell

@property (weak, nonatomic) id<ERCCurrencyDisplayCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel* codeLabel;
@property (weak, nonatomic) IBOutlet UILabel* symbolLabel;
@property (weak, nonatomic) IBOutlet UILabel* nameLabel;
@property (weak, nonatomic) IBOutlet UISwitch* selectionSwitch;

@end

@protocol ERCCurrencyDisplayCellDelegate <NSObject>

@optional
- (void)ERCCurrencyDisplayCell:(ERCCurrencyDisplayCell*)currencyDisplayCell flippedSwitchToState:(bool)state;

@end
