//
//  ViewController.swift
//  Example-iOS
//
//  Created by Dmitry on 12/4/17.
//

import UIKit
import Navigation

enum LoginInputs: Input {
    var hashValue: Int {
        return 0
    }
    
    case login
}

class LoginGate: Gate {
    var transferTable: [Transfer] = [
        PushTransfer(LoginInputs.login, ViewController.self, ViewController.self)
    ]
    
    var currentStage: Stage = ViewController()
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

