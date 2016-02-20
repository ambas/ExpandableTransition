//
//  PlistReader.swift
//  Demo
//
//  Created by Ambas Chobsanti on 8/21/2558 BE.
//  Copyright (c) 2558 Taskworld. All rights reserved.
//

import UIKit

public class PlistReader {
    var fileName : String
    var filePath : String
    
   public init(fileName : String) {
        self.fileName = fileName
        //TO-DO: check this.
        self.filePath = NSBundle.mainBundle().pathForResource(fileName, ofType: "plist")!
        
    }
    
    public func arrayFromFile() -> [AnyObject] {
        var arr = NSArray(contentsOfFile: self.filePath)!
        if let swiftArray = arr as NSArray as? [AnyObject] {
            return swiftArray
        } else {
            return []
        }
    }
    
    public func dictionaryFromFile() -> [String : AnyObject] {
        var dict = NSDictionary(contentsOfFile: self.filePath)!
        if let swiftDictionary = dict as NSDictionary as? [String: AnyObject] {
            return swiftDictionary
        } else {
            return [:]
        }
    }
}
