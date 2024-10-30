//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Dias Kaussov on 29.10.2024.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBmi(height: Float, weight: Float) {
        let bmiVal = weight / (height * height)
        if bmiVal < 18.5 {
            bmi = BMI(value: bmiVal,
                      advice: "Underweight",
                      color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            )
        } else if 18.5 < bmiVal && bmiVal < 24.9 {
            bmi = BMI(value: bmiVal,
                      advice: "Normal weight",
                      color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            )
        } else if 25 < bmiVal && bmiVal < 29.9 {
            bmi = BMI(value: bmiVal,
                      advice:"Overweight",
                      color: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            )
        } else if 30 < bmiVal && bmiVal < 34.9 {
            bmi = BMI(value: bmiVal,
                      advice: "Obese",
                      color: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            )
        } else {
            bmi = BMI(value: bmiVal,
                      advice: "Extremely obese",
                      color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            )
        }
    }
    
    func getBmi() -> String {
        let bmiObject = String(format: "%.2f", bmi?.value ?? "0.0")
        return bmiObject
    }
    
    func getAdvice() -> String {
        let bmiObject = bmi?.advice ?? "Did not appear"
        return bmiObject
    }
    
    func getColor() -> UIColor {
        let bmiObject = bmi?.color ?? UIColor(red: 0.0/255.0, green: 191.0/255.0, blue: 255.0/255.0, alpha: 1)
        return bmiObject
    }

}
