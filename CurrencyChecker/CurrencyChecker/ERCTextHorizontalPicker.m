//
//  ERCTextHorizontalPicker.m
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

#import "ERCTextHorizontalPicker.h"

@implementation ERCTextHorizontalPicker

- (void)initWithItemList:(NSArray*)itemArray
{
    [self.pickerView removeFromSuperview];
    self.pickerView = [[AKPickerView alloc] initWithFrame:self.bounds];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:self.pickerView];

    _horizontalPickerItems = itemArray;
}

- (NSUInteger)numberOfItemsInPickerView:(AKPickerView*)pickerView;
{
    return [_horizontalPickerItems count];
}

- (NSString*)pickerView:(AKPickerView*)pickerView titleForItem:(NSInteger)item;
{
    return [_horizontalPickerItems objectAtIndex:item];
}

@synthesize delegate;
- (void)pickerView:(AKPickerView*)pickerView didSelectItem:(NSInteger)item;
{
    _selectedItem = [_horizontalPickerItems objectAtIndex:item];
    [self.delegate textHorizontalPicker:self itemChanged:self.selectedItem atIndex:item];
}

- (void)setFont:(UIFont*)font
{
    self.pickerView.font = font;
}

- (void)setHighlightedFont:(UIFont*)font
{
    self.pickerView.highlightedFont = font;
}

- (void)setTextColor:(UIColor*)color
{
    self.pickerView.textColor = color;
}

- (void)setHighlightedTextColor:(UIColor*)color
{
    self.pickerView.highlightedTextColor = color;
}

- (void)setInterItemSpacing:(CGFloat)spacing
{
    self.pickerView.interitemSpacing = spacing;
}

- (void)setFisheyeFactor:(CGFloat)factor
{
    self.pickerView.fisheyeFactor = factor;
}

- (void)setPickerStyleTo3D
{
    self.pickerView.pickerViewStyle = AKPickerViewStyle3D;
}

- (void)setPickerStyleToFlat
{
    self.pickerView.pickerViewStyle = AKPickerViewStyleFlat;
}

- (NSString*)getSelectedItem
{
    return _selectedItem;
}

- (void)selectItem:(NSUInteger)item withAnimation:(BOOL)animation notifySelection:(BOOL)notifySelection
{
    [self.pickerView scrollToItem:item animated:animation];
    [self.pickerView selectItem:item animated:animation notifySelection:notifySelection];
    _selectedItem = [_horizontalPickerItems objectAtIndex:item];
}

- (void)refresh
{
    [self.pickerView reloadData];
}

@end
