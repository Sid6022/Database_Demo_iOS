//
//  ViewController.swift
//  sagar_practical
//
//  Created by Admin on 27/10/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblQustions: UILabel!
    @IBOutlet var lblAns: [UILabel]!
    @IBOutlet weak var lblTimer: UILabel!

    
    var aLimitTime = 30
    var aQustion = 1
    var aTimer = Timer()
    var intTotalScore = Int()
    var strRightAns = String()
    var arrQueData  = NSMutableArray()
    
 
     //MARK:- viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        CounterTimer()
        FetchQueData()
    }
    
  //MARK:- FetchQueData From DB
    
    func FetchQueData()  {
        arrQueData = ModelManager.getinsta().getdata()
        print(arrQueData.count)
        guard arrQueData.count > 0 else { return }
         aQustion = arrQueData.count - 1
         NewQuestion()
    }
    

    //MARK:- NewQuestion
    
    func NewQuestion() {
        guard arrQueData.count > 0 else { return }
            let aNewQue : QuestionModel = arrQueData.object(at: aQustion) as! QuestionModel
            lblQustions.text = aNewQue.strQuestion
            lblAns[0].text = aNewQue.strAns1
            strRightAns = aNewQue.strAns1
            lblAns[1].text = aNewQue.strAns2
            lblAns[2].text = aNewQue.strAns3
            lblAns[3].text = aNewQue.strAns4
            guard aQustion >= 0 else { return }
            CounterTimer()
            aQustion -= 1
    }
    
    
    //MARK:- Counter
    
    func CounterTimer() {
        aTimer.invalidate()
        aLimitTime = 30
        aTimer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(self.updateTimerlbl)), userInfo: nil, repeats: true)
    }
    
     //MARK:- labal update
    
    @objc func updateTimerlbl(){
        aLimitTime -= 1
        lblTimer.text = "\(aLimitTime)"
        
        if aLimitTime == 0 {
            aTimer.invalidate()
            intTotalScore += -5
            print("total score : \(intTotalScore)")
            NewQuestion()
        }
    }
  
    
    
    //MARK:- Button Tap Event
    
    @IBAction func btnTapSkip(_ sender: UIButton) {
          intTotalScore += -10
        guard  aQustion >= 0 else {
            aTimer.invalidate()
            let aScoreVC = self.storyboard?.instantiateViewController(withIdentifier: "ScoreVC") as! ScoreVC
            aScoreVC.aScore = intTotalScore
            self.navigationController?.pushViewController(aScoreVC, animated: true)
            return }
      
        NewQuestion()
    }
    
    @IBAction func btnTapAns(_ sender: UIButton){
        
        switch sender.tag {
        case 101:
           print("1")
        case 102:
            print("2")
        case 103:
            print("3")
        case 104:
            print("4")
        default:
            print("Nothing")
        }
        
    }
    
    
}

