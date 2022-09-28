//
//  ViewController.swift
//  Project2
//
//  Created by Alisha on 2022/9/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!
    
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var currentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","uk","us"]
        correctAnswer = Int.random(in: 0...2)
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }
    func askQuestion(action: UIAlertAction!) {
        // shuffle before setImage
        countries.shuffle()
        
        currentQuestion += 1
        title = "Question \(currentQuestion): \(countries[correctAnswer].uppercased()) , Score: \(score)"
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        //Place askQuestion rather than askQuestion() in handler can lead player to the next game. But if we place askQuestion() in handler just excute method. Besides handler need a closure.
        //handler內放置askQuestion而不是askQuestion()的原因是，askQuestion()是程式執行的結果，但handler裡面是要放一個closure，如此一來玩家才可以再玩下一關
        //每玩下一關都需要按下UIAlertAction，所以askQuestion程式裡需要傳入一個UIAlertAction參數，否則會出現type error，“Cannot convert value of type ‘() -> ()’ to expected argument type ‘((UIAlertAction) -> Void)?’.”
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

