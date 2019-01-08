//
//  SafeAreaManager.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/7/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit

class SafeAreaManager {
    
    /// Return an offset from the top of the screen that represents the safe area that is fully
    /// visible and not obstructed by the notch or status bar.
    static let safeAreaTopOffset: CGFloat = {
        guard let window = UIApplication.shared.keyWindow,
            #available(iOS 11, *) else {
                return statusBarHeight
        }
        
        if #available(iOS 12, *) {
            return window.safeAreaInsets.top
        } else {
            if window.safeAreaInsets.top == 0.0 {
                return statusBarHeight
            } else {
                return window.safeAreaInsets.top
            }
        }
    }()
    
    static let statusBarHeight: CGFloat = {
        return 20.0
    }()
    
    static func headerHeight(for image: UIImage) -> CGFloat {
        return image.size.height + SafeAreaManager.safeAreaTopOffset - statusBarHeight
    }
    
    static let safeAreaBottomOffset: CGFloat = {
        guard let window = UIApplication.shared.keyWindow,
            #available(iOS 11, *) else {
                return 0.0
        }
        return window.safeAreaInsets.bottom
    }()
    
    /// Return an offset from the bottom of the screen that represents the safe area to display
    /// above either the keyboard (if the keyboard is visible), or the actual safe area inset if
    /// the keyboard is not visible.
    static func bottomOffsetWith(keyboardHeight: CGFloat) -> CGFloat {
        if keyboardHeight > 0 {
            return keyboardHeight
        } else {
            return safeAreaBottomOffset
        }
    }
    
    /// Returns the total height for a standard nav bar, including status bar and safe area offsets
    static let navigationBarHeight: CGFloat = {
        return 44.0 + SafeAreaManager.safeAreaTopOffset
    }()
}
