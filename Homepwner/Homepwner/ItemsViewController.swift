//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Go7hic on 2019/9/23.
//  Copyright © 2019 Go7hic. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }
    @IBAction func addNewsItem(_ sender: UIBarButtonItem) {
        let newItem = itemStore.createItem()
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }
//    @IBAction func toggleEditingModel(_ sender: UIButton) {
//        if isEditing {
//            sender.setTitle("Edit", for: .normal)
//            setEditing(false, animated: true)
//        } else {
//            sender.setTitle("Done", for: .normal)
//            setEditing(true, animated: true)
//        }
//
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the height of the status bar
//        let statusBarHeight = UIApplication.shared.statusBarFrame.height
//
//        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
//        tableView.contentInset = insets
//        tableView.scrollIndicatorInsets = insets
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // If the triggered segue is the "showItem" segue
         switch segue.identifier {
         case "ShowItem"?:
             // Figure out which row was just tapped
             if let row = tableView.indexPathForSelectedRow?.row {
                 
                 // Get the item associated with this row and pass it along
                 let item = itemStore.allItems[row]
                 let detailViewController = segue.destination as? DetailViewController
                
                detailViewController!.item = item
             }
         default:
             preconditionFailure("Unexpected segue identifier.")
         }
     }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        
//        cell.textLabel?.text = item.name
//        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text=item.serialNumber
        cell.valueLabel.text="$\(item.valueInDollars)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                             handler: { (action) -> Void in
                                                // Remove the item from the store
                                                self.itemStore.removeItem(item)
                                                
                                                // Also remove that row from the table view with an animation
                                                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}
