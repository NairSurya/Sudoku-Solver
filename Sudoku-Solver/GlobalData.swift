//
//  GlobalData.swift
//  Sudoku-Solver
//
//  Created by Surya on 27/04/16.
//  Copyright © 2016 Surya LLC. All rights reserved.
//

import Foundation

class GlobalData: NSObject {
    /** MAKING SINGLETON **/
    let instance = GlobalData()
    private override init() {
        super.init()
    }
}
