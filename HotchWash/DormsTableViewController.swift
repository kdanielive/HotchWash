//
//  DormsTableViewController.swift
//  HotchWash
//
//  Created by Daniel Kim on 4/15/17.
//  Copyright © 2017 Daniel Kim. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DormsTableViewController: UITableViewController {
    
    let dataManager = DormsData()
    
    var time  = ""

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let todoEndpoint: String = "http://data.sparkfun.com/output/rRdjWZ5rnXiwErdlXaVj.json"
        
        /*
        Alamofire.request(todoEndpoint).responseJSON { response in
            let json = JSON(response.result.value)
            
            if json["runtime"].exists() {
                print("yeah")
            }
            
            print(json[0]["washeropen"])
            print(json[0]["timestamp"].rawString())
        */
        
        /*Alamofire.request(todoEndpoint).responseJSON { response in
            let json = JSON(response.result.value)
            
            self.time = json[0]["runtime"].rawString()!
        }
        
        print(time)*/
        
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
        return dataManager.allDorms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DormCell", for: indexPath) as! DormsTableViewCell
        
        cell.dormLabel.text = dataManager.allDorms[indexPath.row].dormName

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        generalData.currentDorm = dataManager.allDorms[indexPath.row]
    }
    

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
        if(segue.identifier == "MainSegue") {
            let destinationVC = segue.destination as! WashersTableViewController
            destinationVC.currentDorm =
        }
    }
    */

}
