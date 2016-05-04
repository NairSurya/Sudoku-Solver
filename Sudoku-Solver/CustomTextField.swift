//
//  CustomTextField.swift
//  Sudoku-Solver
//
//  Created by Surya on 29/03/16.
//  Copyright © 2016 Surya LLC. All rights reserved.
//

import Foundation
import UIKit

class CustomTextField: UITextField{
    struct Properties {
        private static var width: CGFloat = 0;
        static func setWidth(width: CGFloat){
            Properties.width = width
        }
        
        static func getWidth() -> CGFloat{
            return Properties.width;
        }
        
        
        private static var height: CGFloat = 0;
        static func setHeight(height: CGFloat) {
            Properties.height = height
        }
        
        static func getHeight() -> CGFloat {
            return Properties.height;
        }
    }
    required init!(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    

    var editable: Bool = true
    var value: Int?
    var id: Int?
    var possibleValues = [Int] ()
    var pIndex = 0
    func clear() {
        if editable {
            value = -1
            pIndex = 0
            self.text = ""
        }
    }
    
    func addPossibleValues(val: Int){
        possibleValues.append(val)
    }
    
    func popPossbileValue() -> Int {
        if editable == false {
            return -1
        }
        if pIndex < possibleValues.count {
            return possibleValues[pIndex++]
        }
        
        return -1
    }
    
    func initialize(){
        //Border
//        self.layer.cornerRadius = 15.0;
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.redColor().CGColor
        
        //Background
        self.backgroundColor = UIColor(white: 1, alpha: 0.0)
        
        //Text
        self.textColor = UIColor.blackColor()
        self.textAlignment = NSTextAlignment.Center
        
        // If you need any capitalization
        self.autocapitalizationType = UITextAutocapitalizationType.Words
        self.keyboardType = .NumberPad
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
}