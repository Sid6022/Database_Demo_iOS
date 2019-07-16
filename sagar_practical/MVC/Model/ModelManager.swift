//
//  ModelManager.swift
//  Contac_list
//
//

import UIKit
import FMDB

let insta = ModelManager ()

class ModelManager: NSObject
{
    
    var DB : FMDatabase? = nil
    
    
    class func getinsta() -> ModelManager
    {
        if(insta.DB == nil)
        {
            insta.DB = FMDatabase(path: Util.getPath("database.sqlite"))
        }
        
            return insta
        
    }

    
    func getdata() -> NSMutableArray
    {
        insta.DB!.open()
        let aMtarray : NSMutableArray = NSMutableArray()
        
        do {
            let result = try  insta.DB?.executeQuery("SELECT * FROM quiz", values: nil)

            if (result != nil)
            {
                while (result?.next())!
                {
                    var aQueinfo : QuestionModel = QuestionModel()
                    
                    aQueinfo.strQuestion = (result?.string(forColumn: "question"))!
                   // aQueinfo.strQid = (result?.string(forColumn: "q_id"))!
                    aQueinfo.strAns1 = (result?.string(forColumn: "opt1")) ?? ""
                    aQueinfo.strAns2 = (result?.string(forColumn: "opt2")) ?? ""
                    aQueinfo.strAns3 = (result?.string(forColumn: "opt3")) ?? ""
                    aQueinfo.strAns4 = (result?.string(forColumn: "opt4")) ?? ""
                    aMtarray.add(aQueinfo)
                }
            }
            
        } catch  {
             print("failed: \(error.localizedDescription)")
        }

        return aMtarray
    }


    
}
