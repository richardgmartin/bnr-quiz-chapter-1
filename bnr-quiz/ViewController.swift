//
//  ViewController.swift
//  bnr-quiz
//
//  Created by Richard Martin on 2016-02-28.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXContraint: NSLayoutConstraint!
    
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["From what is cognac made?",
        " What is 7 + 7",
        "What is capital of Vermont?"]
    
    let answers: [String] = ["Grapes",
        " 14",
        "Montpelier"]
    
    var currentQuestionIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question = questions[currentQuestionIndex]
        currentQuestionLabel.text = question

    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // set the label's initial alpha
        nextQuestionLabel.alpha = 0
        
    }

    @IBAction func showNextQuestion(sender: AnyObject) {
        
        ++currentQuestionIndex
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        
        nextQuestionLabel.text = question
        
        answerLabel.text = "???"
        
        animateLabelTransitions()
        
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
        
    }
    
    
    func animateLabelTransitions() {
        
        // animate the alpha
        UIView.animateWithDuration(0.5,
            delay: 0,
            options: [],
            animations: {
                self.currentQuestionLabel.alpha = 0
                self.nextQuestionLabel.alpha = 1
            },
            completion: { _ in
                swap(&self.currentQuestionLabel,
                    &self.nextQuestionLabel)
                
            })
    }
}

