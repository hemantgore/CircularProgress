//
//  ViewController.swift
//  CirclularProgress
//
//  Created by Hemant Gore on 14/11/17.
//  Copyright © 2017 Hemant Gore. All rights reserved.
//

import UIKit
import MTCircularSlider

class ViewController: UIViewController {

    
    
    @IBOutlet weak var temperatureControl: MTCircularSlider!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        temperatureControl.configure([.maxTrackTint(UIColor.green)])
        setValueLabelText()
        
    }
    
    @IBAction func onSlideChange(_ sender: MTCircularSlider) {
        setValueLabelText()
    }
    
    fileprivate func setValueLabelText() {
        temperatureLabel.text = String(Int(temperatureControl.value))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

