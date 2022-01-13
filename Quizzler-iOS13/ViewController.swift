//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Saeem on 11/01/2021.
//  
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [ // Created an array of question numbers
       ["Four + Two is equal to Six.","True"],
       ["Five - Three is greater than One","True"],
       ["Three + Eight is less than Ten","False"]
    ]
    
    var questionNumber = 0 // to keep track which question user is currently reading  so we have created this var questionnumber its value is 0 to match the arrow 0th index. which is the first question.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI() // Calling the function here we need the UI to update when the view loads up and show us the first question in the 0th index of quiz array.
        
    }

    @IBAction func answerButton(_ sender: UIButton) {
        
        // Created a new constant
        let userAnswer = sender.currentTitle // This will tell us which answer the user choose true or false based upon the button title.
        
        let actualAnswer = quiz [questionNumber][1] // This will match the user answer with the correct answer, The correct answer is the 1th element of array.
        
        if userAnswer == actualAnswer { // Here we are creating if else to check whether the user answer is right or wrong if user answer is right, It will print right else wrong!.
            
            print("Right!")
        } else {
            print("Wrong!")
        }
        
        if questionNumber + 1 < quiz.count { // quiz.count is the length of our array.
            // we are adding question number + 1 to secure the fail check or you can say that our app do not crashes when the last question is answered.
            // By adding + 1 we are making sure quiz.count do not goes to count of 3 and then update UI instead update UI on the index 2 so our app do not crashes this way we will never go beyond 2.
            
            questionNumber += 1 // This code is sending us to the next question when a button is pressed on the app true or false.
        } else {
            questionNumber = 0 // This will take us to the first question when the final question is answered. This is creating an endless loop of our questions and answers of course until the user gets bored:).
        }
        
        
        
        updateUI() // Here we are calling this function to update the UI when the question number goes to another question number or increases.
    }
    
    func updateUI(){ // function to update UI for new questions.
        
        questionLabel.text = quiz[questionNumber][0] // This code is connecting quiz and question number and also updating the question label based on the current question number.
    
    }
    
}

