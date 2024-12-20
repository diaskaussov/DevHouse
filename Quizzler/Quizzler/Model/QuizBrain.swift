//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Dias Kaussov on 17.10.2024.
//

import Foundation

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    let quiz = [
        Quiz(text: "A slug's blood is green.", answer: "True"),
        Quiz(text: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Quiz(text: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Quiz(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        Quiz(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Quiz(text: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Quiz(text: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Quiz(text: "Google was originally called 'Backrub'.", answer: "True"),
        Quiz(text: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Quiz(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Quiz(text: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Quiz(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
    ]
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if (userAnswer == quiz[questionNumber].answer) {
            score += 1
            return true
        }
        return false
    }
    
    func updateScore() -> Int {
        return score
    }

    
    func updateText() -> String {
        return quiz[questionNumber].text
    }
    
    func updateProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        }
        else {
            questionNumber = 0
            score = 0
        }
    }
    
}
