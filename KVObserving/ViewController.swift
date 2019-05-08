//
//  ViewController.swift
//  KVObserving
//
//  Created by Victor Lee on 8/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var nameObservationToken: NSKeyValueObservation?
    var ageObservationToken: NSKeyValueObservation?
    
    @objc let user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameObservationToken = observe(\.user.name, options: [.new]) { (strongSelf, change) in
            guard let updatedName = change.newValue else { return }
            strongSelf.nameLabel.text = updatedName
        }
    }

    @IBAction func didTapName() {
        user.name = "Victory"
    }
    
    @IBAction func didTapAge() {
    }
    
    @IBAction func textFieldDidChange() {
    }
}

