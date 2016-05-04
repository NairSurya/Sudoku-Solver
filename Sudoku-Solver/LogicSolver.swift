//
//  LogicSolver.swift
//  Sudoku-Solver
//
//  Created by Surya on 27/04/16.
//  Copyright © 2016 Surya LLC. All rights reserved.
//

import Foundation
import UIKit

class LogicSolver: NSObject {

    let sum: Int = 9 + 8 + 7 + 6 + 5 + 4 + 3 + 2 + 1
    let values: [Int] = [9, 8, 7, 6, 5, 4, 3, 2, 1]


    func setNonEditableValues(arr: [CustomTextField]) {
        for item in arr {
            if item.text?.isEmpty == false {
                item.editable = false
                print("Setting value of \(item.id) to: \(item.text)")
                item.value = Int(item.text!)
            }
            else {
                item.editable = true
            }
        }
    }

    func testFill(arr: [CustomTextField]) {
        arr[2].value = 9;
        arr[3].value = 8;
        arr[4].value = 2;
        arr[5].value = 7;
        arr[9].value = 2;
        arr[10].value = 3;
        arr[11].value = 1;
        arr[20].value = 8;
        arr[28].value = 1;
        arr[30].value = 4;
        arr[33].value = 6;
        arr[36].value = 8;
        arr[40].value = 7;
        arr[44].value = 1;
        arr[47].value = 5;
        arr[50].value = 3;
        arr[52].value = 9;
        arr[60].value = 7;
        arr[69].value = 9;
        arr[70].value = 6;
        arr[71].value = 5;
        arr[75].value = 9;
        arr[76].value = 4;
        arr[77].value = 2;
        arr[78].value = 8;


        for item in arr {
            if item.value != nil {
                item.text = String(item.value!)
                item.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.3)
            }
        }
    }

    func fillValues(arr: [CustomTextField]) {


        for item in arr {
            item.clear()
        }

        for item in arr {
            if item.editable == true {

                let verticalID: Int = item.id! % 9
                let horizontalID: Int = 9 * (item.id! / 9)
                let blockID: Int = getBlockID(item.id!)


                for i in 1...9 {

                    if !verticalValidation(verticalID, arr: arr, value: i) {
                        continue
                    }
                    if !horizontalValidation(horizontalID, arr: arr, value: i) {
                        continue
                    }
                    if !blockValidation(blockID, arr: arr, value: i) {
                        continue
                    }
                    item.addPossibleValues(i)

                }



            }

        }

//        for item in arr {
//            if item.editable {
//                var text: String = ""
//                for i in item.possibleValues {
//                    text = text + String(i)
//                }
//                item.text = text
//            }
//        }

        looper( 0, arr: arr, skip: 0)

    }


    func getBlockID (value: Int) -> Int {

        let rem: Int = value % 9
        let quotient: Int = (value / 9)
        let vertBlockID: Int = rem + ((quotient / 3) * 27)

        let horizontalID: Int = 9 * Int(vertBlockID / 9)
        let dx = vertBlockID - horizontalID;
        let blockID = horizontalID + (3 * Int(dx / 3))
        return blockID

    }

    func newLooper () {
        let START = 0
        let STOP  = -10
        var label = START

        while(label != STOP) {

            switch (label) {
                case START:
                    if a == b {
                    label = 123
                    } else {
                    label = 456
                    }
                    break
                case 123:
                    var j = 5;
                    var x = 2+j;
                case 456:
                    fallthrough
                
                
                
                case STOP:
                    label = STOP
                    break
                default:
                    label = START
                    break
            }
        }
    }


    func looper(var pid: Int, arr: [CustomTextField], var skip: Int) {


        if (pid + skip) < 0 {
            return
        }
        pid = pid + skip

        if(pid == 9) {
            return
        }
        let pointer = arr[pid]
        let pValue = pointer.popPossbileValue()
        if pValue > 0 {

            pointer.value = -1

            let verticalID: Int = pointer.id! % 9
            let horizontalID: Int = 9 * (pointer.id! / 9)
            let blockID: Int = getBlockID(pointer.id!)

            if verticalValidation(verticalID, arr: arr, value: pValue) && horizontalValidation(horizontalID, arr: arr, value: pValue) &&
                blockValidation(blockID, arr: arr, value: pValue) {
                    pointer.value = pValue
                    pointer.text = String(pValue)
                    looper(pid, arr: arr, skip: 1)

            } else {
                looper(pid, arr: arr, skip: 0)

            }
        } else {

            for i in pointer.id!...80 {
                arr[i].clear()
            }

            if skip == 0 {
                skip = -1
            }
            looper(pid, arr: arr, skip: skip)


        }
    }

    func verticalValidation(verticalTopPostion: Int, arr: [CustomTextField], value: Int) -> Bool {
        for index in 0...8 {
            let item = arr[verticalTopPostion + (index * 9)]
            if item.value == value {
                return false
            }
        }

        return true
    }

    func horizontalValidation(horizontalLeftPosition: Int, arr: [CustomTextField], value: Int) -> Bool {
        for index in 0...8 {
            let item = arr[horizontalLeftPosition + index]
            if item.value == value {
                return false
            }
        }
        return true
    }

    func blockValidation(blockID: Int, arr: [CustomTextField], value: Int) -> Bool {
        var i: Int = blockID

        var item: CustomTextField?
        for index in 0...2 {
            item = arr[i + index]
            if item!.value == value {
                return false
            }
        }

        i = blockID + 9
        for index in 0...2 {
            item = arr[i + index]
            if item!.value == value {
                return false
            }
        }

        i = blockID + 18
        for index in 0...2 {
            item = arr[i + index]
            if item!.value == value {
                return false
            }
        }

        return true
    }

    func clearArr(arr: [CustomTextField]) {
        for item in arr {
            if !item.editable {
                item.clear()
            }
        }
    }

    func validate(){

    }

}
