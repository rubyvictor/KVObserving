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
    var inputTextObservationToken: NSKeyValueObservation?
    
    @objc let user = User()
    
    @objc dynamic var inputText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameObservationToken = observe(\.user.name, options: [.new]) { (strongSelf, change) in
            guard let updatedName = change.newValue else { return }
            strongSelf.nameLabel.text = updatedName
        }
        
        ageObservationToken = observe(\.user.age, options: .new) { (vc, change) in
            guard let updatedAge = change.newValue else { return }
            vc.ageLabel.text = String(updatedAge)
        }
        
        inputTextObservationToken = observe(\.inputText, options: .new) { (vc, change) in
            guard let updatedInputText = change.newValue as? String else { return }
            vc.textLabel.text = updatedInputText
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        nameObservationToken?.invalidate()
        ageObservationToken?.invalidate()
    }
    
    
    @IBAction func didTapName() {
        user.name = "Victory"
    }
    
    @IBAction func didTapAge() {
//        user.age = 88
        user.setValue(4444, forKey: "age")
    }
    
    @IBAction func textFieldDidChange() {
        inputText = textField.text
    }
}

