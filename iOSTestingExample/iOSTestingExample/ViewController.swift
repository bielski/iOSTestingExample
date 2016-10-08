//
//  ViewController.swift
//  iOSTestingExample
//
//  Created by Ewa Bielska on 02.06.2016.
//  Copyright © 2016 Ewa Bielska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var answearTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func sendButtonTapped(_ sender: AnyObject) {
        self.answearTextField.text = ""
        self.answearTextField.resignFirstResponder()
    }
}
