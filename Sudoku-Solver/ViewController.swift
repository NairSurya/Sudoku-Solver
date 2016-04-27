//
//  ViewController.swift
//  Sudoku-Solver
//
//  Created by Surya on 29/03/16.
//  Copyright © 2016 Surya LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var container: UIView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        CustomTextField.Properties.width = 30
        CustomTextField.Properties.height = 30
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTextFields()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var mainView: UIView!

    
    var arr = [CustomTextField]()
    private func initializeTextFields() {
        for index in 0...80 {
            var x: CGFloat = CGFloat(index % 8)
            var y: CGFloat = CGFloat(index / 8)
            let frame = CGRect(x: x * CustomTextField.Properties.width , y: y * CustomTextField.Properties.height , width: CustomTextField.Properties.width, height: CustomTextField.Properties.height)
            let textField = CustomTextField(frame: frame)
            arr.append(textField)
            mainView.addSubview(textField)
        }
    }
}
