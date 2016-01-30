//
//  ERCCurrencyDisplayCell.m
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "ERCCurrencyDisplayCell.h"

@implementation ERCCurrencyDisplayCell

- (void)awakeFromNib
{
    [self.selectionSwitch addTarget:self action:@selector(switchFlipped:) forControlEvents:UIControlEventValueChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)switchFlipped:(UISwitch*)senderSwitch
{
    if ([self.delegate respondsToSelector:@selector(ERCCurrencyDisplayCell:flippedSwitchToState:)]) {
        [self.delegate ERCCurrencyDisplayCell:self flippedSwitchToState:self.selectionSwitch.isOn];
    }
}

@end
