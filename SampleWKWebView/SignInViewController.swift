//
//  ViewController.swift
//  Gymglish
//
//  Created by Ronaël Bajazet on 17/01/2016.
//  Copyright © 2016 Gymglish. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Lock portrait orientation for this view
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Portrait
    }
    
    // Dismiss the keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(textField: UITextField) {
        if case let bottomSize = self.view.frame.height - signInButton.frame.origin.y where bottomSize <= 250 {
            UIView.animateWithDuration(0.3, animations: {
                self.view.frame = CGRectOffset(self.view.frame, 0, bottomSize - 260)
            })
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if case let bottomSize = self.view.frame.height - signInButton.frame.origin.y where bottomSize <= 250 {
            UIView.animateWithDuration(0.3, animations: {
                self.view.frame = CGRectOffset(self.view.frame, 0, 260 - bottomSize)
            })
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    // MARK: - Navigation

    @IBAction func userLogIn(sender: UIButton) {
        if usernameTextField.text == "user" && passwordTextField.text == "pass" {
            passwordTextField.text = ""
            performSegueWithIdentifier("GoToTableView", sender: self)
        }
        else {
            let alertVC = UIAlertController(title: "Error", message: "Invalid username or password", preferredStyle: .Alert)
            let ok = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alertVC.addAction(ok)
            self.presentViewController(alertVC, animated: true) { () -> Void in }
        }
    }
}