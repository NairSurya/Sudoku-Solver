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
        
        static func getWidth(){
            return Properties.width
        }
        static var height: CGFloat {
            
            get {
                return self.height
            }
            
            set {
                print("Set height as \(newValue)")
                self.height = newValue
            }
        };
    }
    required init!(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
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
    }
    
}