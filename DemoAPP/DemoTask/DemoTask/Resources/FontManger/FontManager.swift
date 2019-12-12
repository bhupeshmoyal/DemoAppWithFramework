//
//  FontManager.shared.swift
//  DemoTask
//
//  Created by Bhupesh Moyal on 11/12/19.
//  Copyright © 2019 Bhupesh Moyal. All rights reserved.
//

import UIKit

class FontManager : NSObject {
    
     static let shared = FontManager()
    
     var fontMedium : String{
        return "\(UIFont().getFontFamilyName())-Medium"
    }
    
     var fontLight : String{
        return "\(UIFont().getFontFamilyName())-Light"
    }
     var fontRegular : String{
        return "\(UIFont().getFontFamilyName())-Regular"
    }
     var fontSemibold : String{
        return "\(UIFont().getFontFamilyName())-Semibold"
    }
     var fontSemiboldItalic : String{
        return "\(UIFont().getFontFamilyName())-SemiboldItalic"
    }
     var fontHeavy : String{
        return "\(UIFont().getFontFamilyName())-Heavy"
    }
     var fontRegularItalic : String{
        return "\(UIFont().getFontFamilyName())-RegularItalic"
    }
     var fontBold : String{
        return "\(UIFont().getFontFamilyName())-Bold"
    }
     var fontMediumItalic : String{
        return "\(UIFont().getFontFamilyName())-MediumItalic"
    }
     var fontBoldItalic : String{
        return "\(UIFont().getFontFamilyName())-BoldItalic"
    }
     var fontLightItalic : String{
        return "\(UIFont().getFontFamilyName())-LightItalic"
    }
     var fontHeavyItalic : String{
        return "\(UIFont().getFontFamilyName())-HeavyItalic"
    }
    
     let h20 = 20.0
     let h18 = 18.0
     let h16 = 16.0
     let h14 = 14.0
     let h12 = 12.0
     let h10 = 10.0
     let h8 = 8.0
     let h6 = 6.0
    
    
     class func font(_ type : String, _ size : CGFloat) -> UIFont {
        return UIFont(name: baseFont + "_" + type, size: size)!
    }
     func localizedFont(_ type : String, _ size : CGFloat) -> UIFont {
        
        if let font = UIFont(name:type, size: size){
            return font
        }else{
            
            if let fontEn = UIFont(name:FontName.fontMedium, size: size){
                return fontEn
            }else{
                return UIFont(name:"HelveticaNeue-Medium", size: size)!
            }
        }
    }
 }

let baseFont = "HelveticaNeue"

 extension UIFont {
    
     func getFontFamilyName() -> String {
        return baseFont
    }
}


enum FontName {
    
    static let fontMedium               = "\(baseFont)-Medium"
    static let fontLight                = "\(baseFont)-Light"
    static let fontRegular              = "\(baseFont)-Regular"
    static let fontSemiboldItalic       = "\(baseFont)-SemiboldItalic"
    static let fontSemibold             = "\(baseFont)-Semibold"
    static let fontHeavy                = "\(baseFont)-Heavy"
    static let fontRegularItalic        = "\(baseFont)-RegularItalic"
    static let fontBold                 = "\(baseFont)-Bold"
    static let fontMediumItalic         = "\(baseFont)-MediumItalic"
    static let fontBoldItalic           = "\(baseFont)-BoldItalic"
    static let fontLightItalic          = "\(baseFont)-LightItalic"
    static let fontHeavyItalic          = "\(baseFont)-HeavyItalic"
}

enum StandardSize: Double {
    case h1 = 20.0
    case h2 = 18.0
    case h3 = 16.0
    case h4 = 14.0
    case h5 = 12.0
    case h6 = 10.0
}

struct Fonts {
    
}


