//
//  Created by Ewa Bielska on 14/04/16.
//  Copyright © 2016 Ewa Bielska. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Actions
    @IBAction func sendButtonTapped(sender: AnyObject) {
        writeMessageToDatabase(self.messageTextField.text!)
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.messageTextField.resignFirstResponder()
        writeMessageToDatabase(self.messageTextField.text!)
        return true
    }

    // MARK: Helper
    private func writeMessageToDatabase(message: String) {
        let myRootRef = Firebase(url:"https://incandescent-inferno-4062.firebaseio.com")
        myRootRef.setValue(message)
        self.messageTextField.text = ""
    }
}
