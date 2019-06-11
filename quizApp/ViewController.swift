//
//  ViewController.swift
//  quizApp
//
//  Created by Rishabh Bhandari on 03/06/19.
//  Copyright © 2019 Rishabh Bhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let question = ["Who is India's Prime Minister?", "Who is the captain if India's men cricket team?","what is my favourite color?"]
    let answer = [["Narendra Modi","Rahul Baba","Mamta Didi"],["Virat Kohli","Rohit Sharma","M S Dhoni"],["Darkness","Gray","Black"]]
    
    var currentQuestion = 0
    var correctAnswerPlacement: UInt32 = 0
    var score = 0

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func answerAction(_ sender: UIButton) {
        
        if sender.tag == correctAnswerPlacement {
            print("correct")
            score+=1
            scoreLabel.text = String(score)
            //sender.backgroundColor = .green
        }
        else {
            print("Wrong")
            //sender.backgroundColor = .red
        }
        
        if currentQuestion != question.count
        {
            newQuestion()
        }
        else {
            
            var alert = UIAlertController(title: "Congratulation!", message: "You scored \(score) points! ", preferredStyle: .alert)
            var action = UIAlertAction(title:"New Game?", style: .default, handler: {
                action in
                self.newgame()
                
            })
            
            alert.addAction(action)
            present(alert,animated: true, completion: nil)
            
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scoreLabel.text = "0"
        newQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func newQuestion() {
        questionLabel.text = question[currentQuestion]
        
        correctAnswerPlacement = arc4random_uniform(3)+1
        
        var button:UIButton = UIButton()
        var x=1
        

        for i in 1...3 {
            
            button = view.viewWithTag(i) as! UIButton
            
            button.backgroundColor = .darkGray
        }
        
        
        
        for i in 1...3 {
            
            button = view.viewWithTag(i) as! UIButton
            
            if i == correctAnswerPlacement{
                button.setTitle(answer[currentQuestion][0], for:    .normal)
            }
            else {
                button.setTitle(answer[currentQuestion][x], for: .normal)
                x=2
            }
            
        }
        currentQuestion += 1
        
    }
func newgame()
{currentQuestion = 0
    correctAnswerPlacement = 0
    score = 0
    scoreLabel.text = String(score)
    newQuestion()
    }

}

