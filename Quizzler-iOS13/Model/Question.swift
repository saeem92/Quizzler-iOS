//
//  Question.swift
//  Quizzler App
//
//  Created by saeem  on 15/01/22.
//
//  The convention is to name your file same as the structure so we have named our files Question!

import Foundation

struct Question {    // Creating a structure to display different quesitons to the userm
    
    let text: String
    let answer: String
    
    // Below we have created an initializer to reduce the code length of quiz array in View Controller
    init(q:String, a:String) {
        text=q
        answer=a
    }
}

