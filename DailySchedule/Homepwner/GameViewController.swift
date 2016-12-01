//
//  GameViewController.swift
//  Daily Schedule
//
//  Created by Celena Haase on 5/11/16.
//  Copyright © 2016 Celena Haase. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var taskLabel: UILabel!
    
    @IBOutlet var timerCountingDown: UILabel!
    
    @IBOutlet var imageToMotivate: UIImageView!
    
    
@IBAction func rotateThruItems(sender: AnyObject) {
        
          print("do something here")
    
    }

    var item: Item!
    var itemStore: ItemStore!
    var imageStore: ImageStore!
  
 
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       
        taskLabel.text = item.name
        timerCountingDown.text = item.serialNumber
   
        let key = item.itemKey
       
        let imageToDisplay = imageStore.imageForKey(key)
        imageToMotivate.image = imageToDisplay
        
    }
    
    
   
   
}
