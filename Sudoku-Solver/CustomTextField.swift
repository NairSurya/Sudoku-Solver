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
    
    required init!(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //Border
        self.layer.cornerRadius = 15.0;
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.redColor().CGColor
        
        //Background
        self.backgroundColor = UIColor(white: 1, alpha: 0.0)
        
        //Text
        self.textColor = UIColor.whiteColor()
        self.textAlignment = NSTextAlignment.Center
        
        // If you need any capitalization
        self.autocapitalizationType = UITextAutocapitalizationType.Words
    }
    
}