//
//  Util.swift
//  Contac_list
//
//  Created by SOTSYS034 on 02/06/17.
//  Copyright © 2017 SOTSYS034. All rights reserved.
//

import UIKit

class Util: NSObject
{
    
    class func getPath(_ fileName: String) -> String {
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent(fileName)
        print(fileURL)
        
        return fileURL.path
    }

    
    
    class func copyFile(_ fileName: NSString) {
        let dbPath: String = getPath(fileName as String)
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: dbPath)
        {
            
            let documentsURL = Bundle.main.resourceURL
            let fromPath = documentsURL!.appendingPathComponent(fileName as String)
            
            var error : NSError?
            do {
                try fileManager.copyItem(atPath: fromPath.path, toPath: dbPath)
            }
            catch let error1 as NSError
            {
                error = error1
                
            }
            
            
            
            if (error != nil) {
                
                print("Error Occured")
            }
                
            else
                
            {
                print("Successfully Copy")
                
            }
            
            
        }
    }

    
    
}
