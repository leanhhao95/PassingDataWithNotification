//
//  PassingDataTableVC.swift
//  passingData
//
//  Created by AnhHao on 11/14/17.
//  Copyright © 2017 AnhHao. All rights reserved.
//

import UIKit

class PassingDataTableVC: UITableViewController {
    var arrayString  = ["hao", "luyen", "cuong", "h.a"]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotification()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayString.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNumber", for: indexPath)

        cell.textLabel?.text = arrayString[indexPath.row]

        return cell
    }
    // MARK: Navigation
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataPassing = arrayString[(tableView.indexPathForSelectedRow!.row)]
        NotificationCenter.default.post(name: .updateData, object: dataPassing )
        tableView.reloadData()
    }
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadData(_:)), name: .receiveData , object: nil)
    }
    @objc func reloadData(_ notification: NSNotification) {
        arrayString.append(notification.object as! String
        )
        tableView.reloadData()
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    // MARK: Navigation
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "viewNext", sender: self)
//    }


    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

   

}
extension Notification.Name {
    static let updateData = Notification.Name.init("updateData")
    static let receiveData = Notification.Name.init("receiveData")
}
