//
//  ViewController.swift
//  Quizzler App
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
    
    var quizBrain = QuizBrain() // This is used to call quiz brain function in our view controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI() // Calling the function here we need the UI to update when the view loads up and show us the first question in the 0th index of quiz array.
        
    }

    @IBAction func answerButton(_ sender: UIButton) {
        
        // Created a new constant
        let userAnswer = sender.currentTitle! // Using force unwrapping in current title by adding '!' and this turns our user answer to an actual string
        let userGotItRight = quizBrain.checkAnswer(userAnswer) // This will tell us which answer the user choose true or false based upon the button title we have got it from the function created in the quizbrain file.
        
         // This will match the user answer with the correct answer, The correct answer is the 1th element of array.
        
        if userGotItRight { // Here we are creating if else to check whether the user answer is right or wrong if user answer is right, It will print right else wrong!.
            
            sender.backgroundColor = UIColor.green // This will show user green color when answer is correct!
        } else {
            sender.backgroundColor = UIColor.red  // This will show user red color when answer is correct!.
        }
        
        quizBrain.nextQuestion() // Here we are calling this function to go to the next question when user has answered the current one this function is helping us showing new questions to the user.
        
       Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false) // This code is showing color on the button depending upon whether it is right or wrong this code makes sure that it takes 0.2 second delays to show the color and when we go to the next question the color gets clear as we have written UIcolor.clear in func updateUI()
        
        
        
        // We have commented because we are using it in the above code updateUI() // Here we are calling this function to update the UI when the question number goes to another question number or increases.
    }
    
    @objc func updateUI() { // function to update UI for new questions.
        
        questionLabel.text = quizBrain.getQuestionText()
        // This code is connecting quiz and question number and also updating the question label based on the current question number.
        progressBar.progress = quizBrain.getProgress()
        // progressBar.progress code is helping us managing our progress bar we have used float here. In the above code we are diving question number from the total number of elements in quiz array so that we can see the progress.
        // We have used + 1 to see some progress in our progressbar when it is at the first question.
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        
      
    
    }
    
}

