//
//  FontManager.shared.swift
//  DemoTask
//
//  Created by Bhupesh Moyal on 11/12/19.
//  Copyright © 2019 Bhupesh Moyal. All rights reserved.
//

import UIKit

public class FontManager : NSObject {
    
    public static let shared = FontManager()
    
    public var fontMedium : String{
        return "\(UIFont().getFontFamilyName())-Medium"
    }
    
    public var fontLight : String{
        return "\(UIFont().getFontFamilyName())-Light"
    }
    
    public var fontRegular : String{
        return "\(UIFont().getFontFamilyName())-Regular"
    }
    
    public var fontSemibold : String{
        return "\(UIFont().getFontFamilyName())-Semibold"
    }
    
    public var fontSemiboldItalic : String{
        return "\(UIFont().getFontFamilyName())-SemiboldItalic"
    }
    
    public var fontHeavy : String{
        return "\(UIFont().getFontFamilyName())-Heavy"
    }
    
    public var fontRegularItalic : String{
        return "\(UIFont().getFontFamilyName())-RegularItalic"
    }
    
    public var fontBold : String{
        return "\(UIFont().getFontFamilyName())-Bold"
    }
    
    public var fontMediumItalic : String{
        return "\(UIFont().getFontFamilyName())-MediumItalic"
    }
    
    public var fontBoldItalic : String{
        return "\(UIFont().getFontFamilyName())-BoldItalic"
    }
    
    public var fontLightItalic : String{
        return "\(UIFont().getFontFamilyName())-LightItalic"
    }
    
    public var fontHeavyItalic : String{
        return "\(UIFont().getFontFamilyName())-HeavyItalic"
    }
    
    public let h20 = 20.0
    public let h18 = 18.0
    public let h16 = 16.0
    public let h14 = 14.0
    public let h12 = 12.0
    public let h10 = 10.0
    public let h8 = 8.0
    public let h6 = 6.0
    
    public class func font(_ type : String, _ size : CGFloat) -> UIFont {
        return UIFont(name: baseFont + "_" + type, size: size)!
    }
    
    public func localizedFont(_ type : String, _ size : CGFloat) -> UIFont {
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
public let baseFont = "HelveticaNeue"

 extension UIFont {
    
     public func getFontFamilyName() -> String {
        return baseFont
    }
}

public enum FontName {
    
    public static let fontMedium               = "\(baseFont)-Medium"
    public static let fontLight                = "\(baseFont)-Light"
    public static let fontRegular              = "\(baseFont)-Regular"
    public static let fontSemiboldItalic       = "\(baseFont)-SemiboldItalic"
    public static let fontSemibold             = "\(baseFont)-Semibold"
    public static let fontHeavy                = "\(baseFont)-Heavy"
    public static let fontRegularItalic        = "\(baseFont)-RegularItalic"
    public static let fontBold                 = "\(baseFont)-Bold"
    public static let fontMediumItalic         = "\(baseFont)-MediumItalic"
    public static let fontBoldItalic           = "\(baseFont)-BoldItalic"
    public static let fontLightItalic          = "\(baseFont)-LightItalic"
    public static let fontHeavyItalic          = "\(baseFont)-HeavyItalic"
}

public enum StandardSize: Double {
    case h1 = 20.0
    case h2 = 18.0
    case h3 = 16.0
    case h4 = 14.0
    case h5 = 12.0
    case h6 = 10.0
}

struct Fonts {
    
}
