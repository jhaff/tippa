    //
//  ResultsViewController.swift
//  tippa
//
//  Created by Jacob Haff on 6/26/20.
//  Copyright © 2020 Jacob Haff. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: Double = 0.0
    var tip: Int = 0
    var split: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        totalLabel.text = String(result)
               
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
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
        self.dismiss(animated: false) {
            print("yay")
        }
    }
    
}
