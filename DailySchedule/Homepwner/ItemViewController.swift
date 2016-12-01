//
//  ItemViewController.swift
//  Daily Schedule
//
//  Created by Celena Haase on 4/8/16.
//  Copyright © 2016 Celena Haase. All rights reserved.
//



import UIKit

class ItemsViewContoller: UITableViewController {
    
    var itemStore: ItemStore!
    var imageStore: ImageStore!

    var holdTheSetCount = 0 //to loop through all the 8 items to start with
    
    @IBAction func addNewItem(sender: AnyObject){
        //Create a new item and add to the store
       
        let newItem = itemStore.createItem(holdTheSetCount)
        holdTheSetCount += 1

        if let index = itemStore.allItems.indexOf(newItem){
        let indexPath = NSIndexPath(forRow: index, inSection: 0)

        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
        
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
       
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        
        let item = itemStore.allItems[indexPath.row]
    
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber

        if item.isChecked == true {
        let checkedImage = UIImage(named:  "checked")! as UIImage
        cell.newCheckbox.setImage(checkedImage, forState: .Normal)
        }
               return cell 
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Confirm to delete \(item.name)?"
            let message = "Are you sure?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
 
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler:nil)
          
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler:
                {(action) -> Void in
                  
                    self.itemStore.removeItem(item)
                   
                    self.imageStore.deleteImageForKey(item.itemKey)
                   
                    self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                    }) 
            ac.addAction(deleteAction)
            
            presentViewController(ac, animated: true, completion: nil)
        }
    } //commmit editing style
    
    override func tableView(tableView:UITableView, moveRowAtIndexPath
        sourceIndexPath:NSIndexPath, toIndexPath destinationIndexPath:NSIndexPath){
        //update the model
        itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowItem" {
            if let row = tableView.indexPathForSelectedRow?.row {
                
                let item = itemStore.allItems[row]
                let detailViewController = segue.destinationViewController as! DetailViewController
                detailViewController.item = item
                detailViewController.imageStore = imageStore
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 65
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem()
    }
    
}




