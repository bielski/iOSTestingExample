//
//  ViewController.swift
//  iOSTestingExample
//
//  Created by Ewa Bielska on 02.06.2016.
//  Copyright © 2016 Ewa Bielska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var answerTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK - IBActions
    
    @IBAction func callGithubButtonTapped(_ sender: Any) {
        let url = URL(string: "http://www.github.com")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                self.showAlertWithMessage("\(httpResponse.statusCode)")
            }
        }
        task.resume()
    }
    
    @IBAction func sendButtonTapped(_ sender: AnyObject) {
        self.answerTextField.text = ""
        self.answerTextField.resignFirstResponder()
    }
    
    // MARK - Helper method
    
    fileprivate func showAlertWithMessage(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
