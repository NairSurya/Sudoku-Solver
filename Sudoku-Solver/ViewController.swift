//
//  ViewController.swift
//  Sudoku-Solver
//
//  Created by Surya on 29/03/16.
//  Copyright © 2016 Surya LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func onSolvePressed(sender: UIButton) {
        print("Pressed...")
        let solver = LogicSolver()
        solver.testFill(arr)
        solver.setNonEditableValues(arr)
        solver.fillValues(arr)
    }
    
    @IBOutlet var container: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dx = screenSize.width / 9.0
        CustomTextField.Properties.setWidth(dx)
        CustomTextField.Properties.setHeight(dx)
        
        initializeTextFields()
    }
    let screenSize: CGRect = UIScreen.mainScreen().bounds

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var mainView: UIView!
    
    var arr = [CustomTextField]()
    private func initializeTextFields() {
        for index in 0...80 {
            let x = CGFloat(index % 9)
            let y = CGFloat(index / 9)
            let frame = CGRect(x: x * CustomTextField.Properties.getWidth() , y: y * CustomTextField.Properties.getHeight() , width: CustomTextField.Properties.getWidth(), height: CustomTextField.Properties.getHeight())
            let textField = CustomTextField(frame: frame)
            textField.id = index
            arr.append(textField)
            mainView.addSubview(textField)
        }
    }
    

}
