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
    
    var questionNumber = 0 // to keep track which question user is currently reading  so we have created this var questionnumber its value is 0 to match the arrow 0th index. which is the first question.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI() // Calling the function here we need the UI to update when the view loads up and show us the first question in the 0th index of quiz array.
        
    }

    @IBAction func answerButton(_ sender: UIButton) {
        
        // Created a new constant
        let userAnswer = sender.currentTitle // This will tell us which answer the user choose true or false based upon the button title.
        
        let actualAnswer = quiz[questionNumber].answer // This will match the user answer with the correct answer, The correct answer is the 1th element of array.
        
        if userAnswer == actualAnswer { // Here we are creating if else to check whether the user answer is right or wrong if user answer is right, It will print right else wrong!.
            
            sender.backgroundColor = UIColor.green // This will show user green color when answer is correct!
        } else {
            sender.backgroundColor = UIColor.red  // This will show user red color when answer is correct!.
        }
        
        if questionNumber + 1 < quiz.count { // quiz.count is the length of our array.
            // we are adding question number + 1 to secure the fail check or you can say that our app do not crashes when the last question is answered.
            // By adding + 1 we are making sure quiz.count do not goes to count of 3 and then update UI instead update UI on the index 2 so our app do not crashes this way we will never go beyond 2.
            
            questionNumber += 1 // This code is sending us to the next question when a button is pressed on the app true or false.
        } else {
            questionNumber = 0 // This will take us to the first question when the final question is answered. This is creating an endless loop of our questions and answers of course until the user gets bored:).
        }
        
       Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false) // This code is showing color on the button depending upon whether it is right or wrong this code makes sure that it takes 0.2 second delays to show the color and when we go to the next question the color gets clear as we have written UIcolor.clear in func updateUI()
        
        
        
        // We have commented because we are using it in the above code updateUI() // Here we are calling this function to update the UI when the question number goes to another question number or increases.
    }
    
    @objc func updateUI(){ // function to update UI for new questions.
        
        questionLabel.text = quiz[questionNumber].text // This code is connecting quiz and question number and also updating the question label based on the current question number.
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
        
        // progressBar.progress code is helping us managing our progress bar we have used float here. In the above code we are diving question number from the total number of elements in quiz array so that we can see the progress.
        // We have used + 1 to see some progress in our progressbar when it is at the first question.
    
    }
    
}

