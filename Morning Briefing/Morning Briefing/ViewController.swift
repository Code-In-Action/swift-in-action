//
//  ViewController.swift
//  Morning Briefing
//
//  Created by Go7hic on 2019/9/14.
//  Copyright © 2019 Go7hic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let navController = self.navigationController {
            navController.navigationBar.barTintColor = UIColor.orange
            navController.navigationBar.tintColor = UIColor.white
            self.title = "Rise & Shine"
        }
        setupGIF(of: "sunshine")
     
        // Do any additional setup after loading the view, typically from a nib.
    }
 
    private func setupGIF(of searchTerm: String) {
        guard let encodedSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
            let searchURL = URL(string:"http://api.giphy.com/v1/gifs/translate?s=\(encodedSearchTerm)&api_key=dc6zaTOxFJmzC") else { return }
        let searchData = try? Data(contentsOf: searchURL)
        
        // Parse the JSON by accessing multiple levels of dictionaries to get the gif's link
        do {
            if let jsonResult = try JSONSerialization.jsonObject(with: searchData!, options: []) as? [String: Any] {
                guard let images = (jsonResult["data"] as? [String: Any])?["images"] as? [String: Any],
                    let link = (images["downsized"] as? [String: String])?["url"],
                    let url = URL(string: link),
                    let gifData = try? Data(contentsOf: url),
                    let gif = UIImage(data: gifData) else { return }
                self.imageView.image = gif // display the gif we found
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    


}

