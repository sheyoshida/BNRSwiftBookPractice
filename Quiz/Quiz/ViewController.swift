//
//  ViewController.swift
//  Quiz
//
//  Created by Shena Yoshida on 4/18/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["From what is congac made?",
                               "What is 7 + 7?",
                               "What is the capital of Vermont?"]
    
    let answers: [String] = ["Grapes",
                             "14",
                             "Montpelier"]
    
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() { // override
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex] // question 0 appears when app loads
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // set label's initial alpha
        nextQuestionLabel.alpha = 0
    }
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex += 1
        
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions() // call animate when button tapped
    }

    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    func animateLabelTransitions() {
        
        // animate the alpha
//        UIView.animateWithDuration(0.5, animations: { // closure
//            self.currentQuestionLabel.alpha = 0
//            self.nextQuestionLabel.alpha = 1
//        })
        
        UIView.animateWithDuration(0.5,
                                   delay: 0,
                                   options: [],
                                   animations: {
                                    self.currentQuestionLabel.alpha = 0
                                    self.nextQuestionLabel.alpha = 1
            },
                                   completion: { _ in // closure to swap values
                                    swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
        })
    }
    
    
}

