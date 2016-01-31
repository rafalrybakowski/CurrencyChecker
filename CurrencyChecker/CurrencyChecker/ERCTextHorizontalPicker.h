//
//  ERCTextHorizontalPicker.h
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "AKPickerView.h"
#import <UIKit/UIKit.h>

@protocol ERCTextHorizontalPickerDelegate;

@interface ERCTextHorizontalPicker : UIView <AKPickerViewDataSource, AKPickerViewDelegate>

@property (nonatomic, strong) AKPickerView* pickerView;
@property (nonatomic, weak) id<ERCTextHorizontalPickerDelegate> delegate;
@property NSArray* horizontalPickerItems;
@property NSString* selectedItem;

- (void)refresh;
- (NSString*)getSelectedItem;
- (void)initWithItemList:(NSArray*)itemArray;

- (void)setFont:(UIFont*)font;
- (void)setHighlightedFont:(UIFont*)font;
- (void)setTextColor:(UIColor*)color;
- (void)setHighlightedTextColor:(UIColor*)color;
- (void)setInterItemSpacing:(CGFloat)spacing;
- (void)setFisheyeFactor:(CGFloat)factor;
- (void)setPickerStyleTo3D;
- (void)setPickerStyleToFlat;
- (void)selectItem:(NSUInteger)item withAnimation:(BOOL)animation notifySelection:(BOOL)notifySelection;

@end

@protocol ERCTextHorizontalPickerDelegate <NSObject>

- (void)textHorizontalPicker:(UIView*)textHorizontalPicker itemChanged:(NSString*)selectedItem atIndex:(NSInteger)index;

@end