//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Go7hic on 2019/7/23.
//  Copyright © 2019 Go7hic. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController{
    @IBOutlet var celsiusLabel:UILabel!
    @IBOutlet var textField: UITextField!
    @IBAction func fahrenHeitFieldEditingChanged(_ textField: UITextField) {
        
        if let text = textField.text, !text.isEmpty{
            celsiusLabel.text = textField.text
        } else {
            celsiusLabel.text = "???"
            
        }
    }
    
    @IBAction func dismissKeyBoard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
}
