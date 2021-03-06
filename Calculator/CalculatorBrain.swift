//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case division = "÷"
    case multiplication = "×"
}


class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        if operatorType != nil {
            operand2String.append(digit)
            return operand2String
        } else {
            operand1String.append(digit)
            return operand1String
        }
    }

    func setOperator(_ operatorString: String) {
        if let math = OperatorType(rawValue: operatorString) {
            operatorType = math
        }
    }

    func calculateIfPossible() -> String? {
        if !operand1String.isEmpty, !operand2String.isEmpty, operatorType != nil    {
            let number1 = Double(operand1String) ?? 0
            let number2 = Double(operand2String) ?? 0
            switch operatorType {
            case .addition:
                return String(number1 + number2)
            case .division:
                return String(number1 / number2)
            case .multiplication:
                return String(number1 * number2)
            case .subtraction:
                return String(number1 - number2)
            default:
                return "Error"
            }
        }
        return nil
    }
}
