//
//  ItemStore.swift
//  Daily Schedule
//
//  Created by Celena Haase on 4/8/16.
//  Copyright © 2016 Celena Haase. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    let itemArchiveURL: NSURL = {
        let documentDirectories =
        NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("items.archive")
    }()
    
    func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path!)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path!)
    }
    
    init(){
        if let archivedItems =
            NSKeyedUnarchiver.unarchiveObjectWithFile(itemArchiveURL.path!) as? [Item]{
            allItems += archivedItems
            
        }
    }
 
    func createItem(moveIt: Int) -> Item {
        
        let newItem = Item(setCount: moveIt)
        
        allItems.append(newItem)
        
        return newItem
        
    } //end function
    
    func removeItem(item: Item) {
        if let index = allItems.indexOf(item){
            allItems.removeAtIndex(index)
            
            }
        }
    
  
    
    
    func moveItemAtIndex(fromIndex: Int, toIndex:Int){
        if fromIndex == toIndex {
            return
            }

    let movedItem = allItems[fromIndex]
    allItems.removeAtIndex(fromIndex)
    allItems.insert(movedItem, atIndex: toIndex)
}
  
} //end class



