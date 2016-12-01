//
//  Item.swift
//  Daily Schedule
//
//  Created by Celena Haase on 4/8/16.
//  Copyright © 2016 Celena Haase. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    var name: String
    var valuedNotes: String?
    var serialNumber: String?
    var taskDetails: String?
    let itemKey: String
    var isChecked: Bool
    
    
    init (name:String, serialNumber:String?, valuedNotes:String?, taskDetails:String?, isChecked:Bool){
        self.name = name
        self.valuedNotes = valuedNotes
        self.serialNumber = serialNumber
        self.taskDetails = taskDetails
        self.itemKey = NSUUID().UUIDString
        self.isChecked = isChecked
       
        super.init()
    }
 
 
    convenience init(setCount: Int = 0){
        if setCount < 8{
    
        let nouns = ["Get focused",
                     "Search for results",
                     "Research what is next",
                     "Your ideas here",
                     "Keep adding effort",
                     "Strategy for obstacles",
                     "More information",
                     "Keep debugging",
                     "Take a fresh look"]  //tasks
        
        
        let presetNoun = nouns[Int(setCount)]
        let randomName = "\(presetNoun)"
        
        let phoneDirectory = ["Be specific",
                              "Timeline",
                              "Be complete",
                              "Keep it going",
                              "Don't be thwarted",
                              "Get excited",
                              "Until it's great",
                              "Get ready with new things"]
        let phoneDirectoryListing = phoneDirectory[Int(setCount)]
        let valuedNotesInit = "To follow up"
        let taskDetailsInit = "Type here"
        let isCheckedInit = false
        
            self.init(name: randomName,
                      serialNumber: phoneDirectoryListing, valuedNotes: valuedNotesInit,
                      taskDetails: taskDetailsInit,
                isChecked:isCheckedInit)
            }
    else{
            self.init(name: "", serialNumber: nil,
                      
                      valuedNotes: "",taskDetails: "",isChecked:false)
    }
}
    required init(coder aDecoder:NSCoder){
        name = aDecoder.decodeObjectForKey("name") as! String
        valuedNotes = aDecoder.decodeObjectForKey("valuedNotes") as! String?
        taskDetails = aDecoder.decodeObjectForKey("taskDetails") as! String?
        itemKey = aDecoder.decodeObjectForKey("itemKey") as! String
        serialNumber = aDecoder.decodeObjectForKey("serialNumber") as! String?
        isChecked = aDecoder.decodeBoolForKey("isChecked") as Bool
        super.init()
    }
    
    
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(name, forKey:"name")
        aCoder.encodeObject(valuedNotes, forKey:"valuedNotes")
        aCoder.encodeObject(taskDetails, forKey:"taskDetails")
        aCoder.encodeObject(itemKey, forKey:"itemKey")
        aCoder.encodeObject(serialNumber, forKey:"serialNumber")
        aCoder.encodeBool(isChecked, forKey: "isChecked")
        
    }
}


