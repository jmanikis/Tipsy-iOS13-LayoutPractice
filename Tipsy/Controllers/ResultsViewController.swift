//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by JC Manikis on 2021-05-28.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalPerPerson = 0.0
    var numberOfPeople = 0
    var tip = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(format: "%.2f", totalPerPerson)
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tip)% tip"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
    
    }
    
}
