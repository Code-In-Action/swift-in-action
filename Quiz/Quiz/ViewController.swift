//
//  ViewController.swift
//  Quiz
//
//  Created by Go7hic on 2019/7/17.
//  Copyright © 2019 Go7hic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questions: [String] = [
        "From what is cognac made?",
        "what is 7 + 7",
        "what is the capital of Vermont?"
    ]
    let answers: [String]  = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    
    var  currentQuestionIndex: Int = 0;
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex += 1;
        if currentQuestionIndex == questions.count {
            currentQuestionIndex  = 0;
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
        
    }
    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer;
    }
    
//    重载，为一个方法提供自定义实现.
//    从数组取出第一个问题，代替占位符
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    

}

