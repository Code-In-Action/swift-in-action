//
//  ConversionViewController.swift
//  FirstApp
//
//  Created by Go7hic on 2019/9/3.
//  Copyright © 2019 Go7hic. All rights reserved.
//

import UIKit
class ConversionViewController: UIViewController {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBAction func fahrenHeitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
                celsiusLabel.text = text
        } else {
              celsiusLabel.text = "???"
        }
        
    }
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
}
