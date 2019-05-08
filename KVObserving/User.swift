//
//  User.swift
//  KVObserving
//
//  Created by Victor Lee on 8/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import Foundation

class User: NSObject {
    @objc dynamic var name = String()
    @objc var age = 0 {
        willSet {
            willChangeValue(forKey: #keyPath(age))
        }
        didSet {
            didChangeValue(for: \User.age)
        }
    }
}
