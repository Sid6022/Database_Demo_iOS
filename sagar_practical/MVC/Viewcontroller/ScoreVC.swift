//
//  ScoreVC.swift
//  sagar_practical
//
//  Created by Admin on 27/10/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ScoreVC: UIViewController {

    @IBOutlet weak var lblScore: UILabel!
    
    var aScore = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    override func viewWillAppear(_ animated: Bool) {
        lblScore.text = " Your Score is \(aScore)"
    }
    
    
    //MARK:- Button Tap
    
    @IBAction func btnTapStartOver(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
}
