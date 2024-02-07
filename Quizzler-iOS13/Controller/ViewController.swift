//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain  = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        updateUI()
    }

    
    
    @IBAction func answerButton(_ sender: UIButton) {
//        if(progressBar.progress == 1.00){
//            finishQuiz()
//        }
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
//            questionNumber = (questionNumber + 1) % quiz.count
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
    
    
//    func finishQuiz(){
//        questionLabel.text = quizBrain.getResults()
//        trueButton.isHidden = true
//        falseButton.isHidden = true
//        
//    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        button1.setTitle(quizBrain.getAnswerTitle()[0], for: .normal)
        button2.setTitle(quizBrain.getAnswerTitle()[1], for: .normal)
        button3.setTitle(quizBrain.getAnswerTitle()[2], for: .normal)
        button1.backgroundColor = UIColor.clear
        button2.backgroundColor = UIColor.clear
        button3.backgroundColor = UIColor.clear
        scoreLabel.text = "Score \( String(quizBrain.correctAnswerNumber))"
        progressBar.progress = quizBrain.getProgress()
       
    }
}

