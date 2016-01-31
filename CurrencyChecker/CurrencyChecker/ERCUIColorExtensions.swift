//
//  ERCUIColorExtensions.swift
//  CurrencyChecker
//
//  Created by Rafał on 30.01.2016.
//  Copyright © 2016 Rafał. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    public class func getColorFromHex(rgbValue: Int) -> UIColor {
        let newColor:UIColor! = UIColor(colorLiteralRed: ((Float)((rgbValue & 0xFF0000) >> 16)) / 255.0,
            green: ((Float)((rgbValue & 0x00FF00) >> 8)) / 255.0,
            blue: ((Float)((rgbValue & 0x0000FF) >> 0)) / 255.0, alpha: 1.0)
        
        return newColor
    }
}