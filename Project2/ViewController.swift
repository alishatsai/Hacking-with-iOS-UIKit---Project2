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
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","uk","us"]
    }


}

