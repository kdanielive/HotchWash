//
//  WashersTableViewController.swift
//  HotchWash
//
//  Created by Daniel Kim on 4/20/17.
//  Copyright © 2017 Daniel Kim. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WashersTableViewController: UITableViewController {
    
    var currentDorm = Dorm(myWasherNum: 0, myDormName: "")
    var time = ""
    var timer = Timer()
    var emptyFlag = ""
    var empty = false
    
    var minutes: Int = 0
    var seconds: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)

        currentDorm = generalData.currentDorm
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentDorm.washerNum * 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WasherCell", for: indexPath) as! WashersTableViewCell
        
        if(indexPath.row < currentDorm.washerNum){
            cell.nameLabel.text = "Washer \(indexPath.row + 1)"
        } else if(indexPath.row < currentDorm.washerNum * 2){
            cell.nameLabel.text = "Dryer \(indexPath.row + 1 - currentDorm.washerNum)"
        }

        cell.timeLabel.text = "\(minutes)min \(seconds)sec"
        cell.timeLabel.adjustsFontSizeToFitWidth = true
        
        if(empty) {
            cell.emptyLabel.text = "Empty"
        } else {
            cell.emptyLabel.text = "Filled"
        }

        return cell
    }
    
    func updateTime() {
        let todoEndpoint: String = "http://data.sparkfun.com/output/rRdjWZ5rnXiwErdlXaVj.json"
        Alamofire.request(todoEndpoint).responseJSON { response in
            let json = JSON(response.result.value)
            
            self.time = json[0]["runtime"].rawString()!
            self.emptyFlag = json[0]["washeropen"].rawString()!
        }
        
        print(time)
        
        minutes = (time as NSString).integerValue / 60
        seconds = (time as NSString).integerValue - minutes * 60
        
        if((self.emptyFlag as NSString).integerValue == 1) {
            empty = true
        } else {
            empty = false
        }

        self.tableView.reloadData()
    }
    
    /*func updateTableView() {
        self.tableView.reloadData()
    }*/

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
