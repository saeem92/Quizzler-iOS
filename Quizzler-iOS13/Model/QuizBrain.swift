//
//  QuizBrain.swift
//  Quizzler App
//
//  Created by SAEEM on 16/01/22.
//
//  You can see how our model is getting all the quiz related responsibilities its now our quizbrain that knows all about the quiz questions not our view controller its also or quiz brain that decides if the user got the answer right or wrong which questions comes next and how far the user progressed.
// We are creating functions here and calling them in the View Controller

import Foundation

// We have created this QuizBrain struct here to use MVC architecture and show the questions written below to the user.
struct QuizBrain {
    var questionNumber = 0  // to keep track which question user is currently reading  so we have created this var questionnumber its value is 0 to match the arrow 0th index. which is the first question.
    let quiz = [ // Created an array of question numbers
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
        
        // Above q & a came here from initializer that we created in question file
    ]
    func checkAnswer(_ userAnswer: String) -> Bool { // This function is created to check user answer and we will call it in viewController!
        if userAnswer == quiz[questionNumber].answer {
           return true // User got it right
        } else {
            return false// User Got it Wrong
        }
    }
        
        func getQuestionText() -> String { // This is used to get to the next questions
            return quiz[questionNumber].text
        }
        
        func getProgress() -> Float {  // This function is used to see progress on the number of questions
            let progress = Float(questionNumber / quiz.count)
            return progress
        }
    
    func nextQuestion() {
        if questionNumber + 1 < quiz.count { // quiz.count is the length of our array.
            // we are adding question number + 1 to secure the fail check or you can say that our app do not crashes when the last question is answered.
            // By adding + 1 we are making sure quiz.count do not goes to count of 3 and then update UI instead update UI on the index 2 so our app do not crashes this way we will never go beyond 2.
            
            questionNumber += 1 // This code is sending us to the next question when a button is pressed on the app true or false.
        } else {
            questionNumber = 0 // This will take us to the first question when the final question is answered. This is creating an endless loop of our questions and answers of course until the user gets bored:).
        }
    }
    
    
}

