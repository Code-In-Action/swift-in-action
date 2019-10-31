//
//  DEtailViewController.swift
//  Homepwner
//
//  Created by Go7hic on 2019/10/20.
//  Copyright © 2019 Go7hic. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
 
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.delegate = self;
        present(imagePicker, animated: true, completion:nil)
    }
    @IBOutlet var imageView: UIImageView!
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialNumberField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    var imageStore: ImageStore
    let numberFormatter: NumberFormatter = {
         let formatter = NumberFormatter()
         formatter.numberStyle = .decimal
         formatter.minimumFractionDigits = 2
         formatter.maximumFractionDigits = 2
         return formatter
     }()
     
     let dateFormatter: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateStyle = .medium
         formatter.timeStyle = .none
         return formatter
     }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.text = item.name
       serialNumberField.text = item.serialNumber
       valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormatter.string(from: item.dateCreated as Date)
        
    }
    internal func imagePickerController(_ picker: UIImagePickerController,
          didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
              
              // Get picked image from info dictionary
              let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
              
              // Store the image in the ImageStore for the item's key
              imageStore.setImage(image, forKey: item.itemKey)
              
              // Put that image onto the screen in our image view
              imageView.image = image
              
              // Take image picker off the screen -
              // you must call this dismiss method
              dismiss(animated: true, completion: nil)
      }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text
        if let valueText = valueField.text,
            let value = numberFormatter.number(from: valueText) {
            item.valueInDollars = value.intValue
        }
        else {
            item.valueInDollars = 0
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
