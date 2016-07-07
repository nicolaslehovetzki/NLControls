//
//  NLTextView.swift
//  designable
//
//  Created by nicolas on 07/07/2016.
//  Copyright © 2016 nicolas. All rights reserved.
//

import Foundation
import UIKit
//coucou les gars

@IBDesignable
public class NLTextView: UITextView, UITextViewDelegate {

    public var wasEdited = false
    
    @IBInspectable
    public var placeHolder: String = "Insert Text" {
        didSet {
            self.text = placeHolder
        }
    }
    
    @IBInspectable
    public var borderRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = borderRadius
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor = UIColor.yellowColor() {
        didSet {
            self.layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable
    public var insetLeft: CGFloat = 0 {
        didSet {
          self.textContainerInset.left = insetLeft
        }
    }
    
    @IBInspectable
    public var insetRight: CGFloat = 0 {
        didSet {
            self.textContainerInset.right = insetRight
        }
    }
    
    @IBInspectable
    public var insetTop: CGFloat = 0 {
        didSet {
            self.textContainerInset.top = insetTop
        }
    }
    
    @IBInspectable
    public var insetBottom: CGFloat = 8 {
        didSet {
            self.textContainerInset.bottom = insetBottom
        }
    }
        
    public func createBorder(width width: CGFloat, borderColor: CGColor, borderRadius: CGFloat){
        self.layer.borderColor = borderColor
        self.layer.borderWidth = width
        self.layer.cornerRadius = borderRadius
    }
    
    public func textViewDidBeginEditing(textView: UITextView) {
        
        self.text = ""
        self.wasEdited = true
    }
    
    public func textViewDidEndEditing(textView: UITextView) {
        
    }
    
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        
       // insetTop = 8
       // borderRadius = 4
        
        super.init(frame: frame, textContainer: textContainer)
    }
    
    required public init?(coder aDecoder: NSCoder) {

        self.insetTop = 8
     //   borderColor = UIColor.brownColor()
        borderRadius = 4

        super.init(coder: aDecoder)
        
        self.delegate = self
    }
}

/**
 Renvoie une UIColor à partir de ses coordonnées en hexadecimal, précédées de #
 */
public extension UIColor {
    convenience init(hexa numberHexa: String, alpha: CGFloat) {
        func toFloat( numberHexa: String) -> CGFloat {
            return CGFloat(strtoul(numberHexa, nil, 16))
        }
        
        if numberHexa.characters.count == 7 {
            let red = toFloat(numberHexa.substringWithRange(
                numberHexa.startIndex.advancedBy(1)..<numberHexa.startIndex.advancedBy(3)))
            
            let green = toFloat(numberHexa.substringWithRange(
                numberHexa.startIndex.advancedBy(3)..<numberHexa.startIndex.advancedBy(5)))
            
            let blue = toFloat(numberHexa.substringWithRange(
                numberHexa.startIndex.advancedBy(5)..<numberHexa.startIndex.advancedBy(7)))
            
            self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
            
        } else {
            self.init(red: 0, green: 0, blue: 0, alpha: alpha)
        }
    }
}

public extension Int {
    var sayHello: String {
        return "Hello \(self)"
    }
}





