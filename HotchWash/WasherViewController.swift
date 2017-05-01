//
//  WasherViewController.swift
//  HotchWash
//
//  Created by Daniel Kim on 5/1/17.
//  Copyright © 2017 Daniel Kim. All rights reserved.
//

import UIKit

class WasherViewController: UIViewController {

    @IBOutlet weak var helpButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func washerButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Help", message: "The time shows the current runtime. The Empty/Full shows whether the washer is currently empty or not", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
