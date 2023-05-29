//
//  SignUpViewController.swift
//  CombineRealmMvvmC
//
//  Created by Saaransh Kaul on 28/05/23.
//

import UIKit

class SignUpViewController: UIViewController, Storyboarded {
    
    // MARK: IBOutlet
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var marksTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    // MARK: Variables
    var viewModel: SignUpViewModel?
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessageLabel.text = ""
    }
    
    // MARK: IBAction
    // This can be handled by CombineLatest to validate if the submit button show enable or not depending on verification
    @IBAction func didTapSubmit(_ sender: Any) {
        guard let userName = userNameTextField.text,
              let password = passwordTextField.text,
              let location = locationTextField.text,
              let age = ageTextField.text,
              let marks = marksTextField.text,
              let major = majorTextField.text else { return}
        
        if userName != "", password != "", location != "", age != "", marks != "", major != "" {
            self.viewModel?.didTapSubmit(userName: userName, password: password, location: location, age: age, marks: marks, major: major)
        } else {
            
            errorMessageLabel.text = "Please Fill In All The Fields To Continue"
        }
    }
    
    /// Action to be done when login button is taped
    /// - Parameter sender: UIButton
    @IBAction func didTapLogin(_ sender: Any) {
        viewModel?.didTapLogin()
    }
    
}
