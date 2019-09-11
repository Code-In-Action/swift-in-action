//
//  ViewController.swift
//  Buggy
//
//  Created by Go7hic on 2019/9/10.
//  Copyright © 2019 Go7hic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Called buttonTapped(:)");
     
    }
    func badMethod() {
        let array = NSMutableArray();
        for i in 0..<10{
            array.insert(i, at: i)
        }
        
        for _ in 0..<10 {
            array.remove(0)
        }
    }

}

