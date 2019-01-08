//
//  UIFont+Extensions.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

enum FontWeight {
    case lightItalic
    case semiBoldItalic
    case regular
    case italic
    case bold
    case black
    case blackItalic
    case ExtraBoldItalic
    case light
    case semiBold
    case extraBold
    case extraLight
    case extraLightItalic
    case boldItalic
}

extension UIFont {
    class func appFont(withWeight fontWeight: FontWeight, fontSize size: CGFloat) -> UIFont {
        return UIFont(name: appFontName(withWeight: fontWeight), size: size)!
    }
    
    class func appFontName(withWeight fontWeight: FontWeight) -> String {
        let weight = weightString(withWeight: fontWeight)
        return "Nunito-\(weight)"
    }
    
    class func weightString(withWeight fontWeight: FontWeight) -> String {
        switch fontWeight {
        case .lightItalic:
            return "LightItalic"
        case .semiBoldItalic:
            return "SemiBoldItalic"
        case .regular:
            return "Regular"
        case .italic:
            return "Italic"
        case .bold:
            return "Bold"
        case .black:
            return "Black"
        case .blackItalic:
            return "BlackItalic"
        case .ExtraBoldItalic:
            return "ExtraBoldItalic"
        case .light:
            return "Light"
        case .semiBold:
            return "SemiBold"
        case .extraBold:
            return "ExtraBold"
        case .extraLight:
            return "ExtraLight"
        case .extraLightItalic:
            return "ExtraLightItalic"
        case .boldItalic:
            return "BoldItalic"
        }
    }
}
