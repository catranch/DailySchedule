//
//  CheckBox.swift
//  Daily Schedule
//
//  Created by Celena Haase on 4/26/16.
//  Copyright © 2016 Celena Haase. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    
    let checkedImage = UIImage(named:  "checked")! as UIImage
    let unCheckedImage = UIImage(named: "unchecked")! as UIImage
    
    var isChecked:Bool = false {
        didSet{
   
            if isChecked == true {
                self.setImage(checkedImage, forState: .Normal)
            }else{
                self.setImage(unCheckedImage, forState: .Normal)
            }
            
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self,action: #selector(CheckBox.buttondClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
    }
    func buttondClicked(sender:UIButton){
        if (sender == self){
            if isChecked == true{
                isChecked = false
            }else{
                isChecked = true
            }
        }
    }
}
