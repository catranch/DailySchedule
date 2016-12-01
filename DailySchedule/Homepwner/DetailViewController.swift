//
//  DetailViewController.swift
//  Daily Schedule
//
//  Created by Celena Haase on 4/19/16.
//  Copyright © 2016 Celena Haase. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var serialNumberField: UITextField!
    
    @IBOutlet var valueField: UITextField!

    @IBOutlet var taskDetailsField: UITextView!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func takePicture(sender: UIBarButtonItem) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    var itemStore: ItemStore!
    var imageStore: ImageStore!
    
    let numberFormatter: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
        let dateFormatter: NSDateFormatter = {
            let formatter = NSDateFormatter()
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .NoStyle
            return formatter
    }()
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = item.valuedNotes
        taskDetailsField.text = item.taskDetails

        let key = item.itemKey
        //display
        let imageToDisplay = imageStore.imageForKey(key)
        imageView.image = imageToDisplay
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        //save changes to item
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text
        item.valuedNotes = valueField.text
        item.taskDetails = taskDetailsField.text
     
    }
    

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
  
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //store the image in the ImageStore
        imageStore.setImage(image, forKey:item.itemKey)
        imageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GameStarter" {
            
            item.name = nameField.text ?? ""
            item.serialNumber = serialNumberField.text
            item.valuedNotes = valueField.text
            item.taskDetails = taskDetailsField.text
            
                let gameViewController = segue.destinationViewController as! GameViewController
                gameViewController.item = item
                gameViewController.imageStore = imageStore
         
        }//image
    }//func

    }
