//
//  ViewController.swift
//  Sudoku-Solver
//
//  Created by Surya on 29/03/16.
//  Copyright © 2016 Surya LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        textField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var mainView: UIView!
    
    func textField() {
        let textField = UITextField(frame: CGRectMake(20.0, 30.0, 100.0, 30.0))
        textField.textAlignment = NSTextAlignment.Center
        textField.textColor = UIColor.blueColor()
        textField.borderStyle = UITextBorderStyle.Line
        textField.autocapitalizationType = UITextAutocapitalizationType.Words // If you need any capitalization
        self.mainView.addSubview(textField)
    }
}

