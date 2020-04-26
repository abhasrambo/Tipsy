//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Abhas Kumar on 4/26/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total:String?
    var totalNumberOFPeople:Double?
    var tipPaid:Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total!
        settingsLabel.text = "Split between \(String(describing: Int(totalNumberOFPeople!))) people, with \(String(describing: Int(tipPaid!*100))) % tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
