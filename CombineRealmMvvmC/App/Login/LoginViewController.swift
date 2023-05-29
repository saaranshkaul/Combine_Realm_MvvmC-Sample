//
//  ViewController.swift
//  CombineRealmMvvmC
//
//  Created by Saaransh Kaul on 28/05/23.
//

import UIKit
import Combine

class LoginViewController: UIViewController, Storyboarded {
    
    // MARK: IBOutlet
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: Variables
    var viewModel: LoginViewModel?
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: IBAction
    /// action on login button tapped
    /// - Parameter sender: UIButton
    @IBAction func didTapLogin(_ sender: Any) {
        guard let userName = usernameTextField.text, let password = passwordTextField.text else { errorMessageLabel.text = "Error"
            return
        }
        if userName != "", password != "" {
            viewModel?.verifyCredentials(userName, password)
        } else {
            errorMessageLabel.text = "Please Enter Credentials"
        }
    }
    
    /// Action to take on Sign Up button tap
    /// - Parameter sender: UIButton
    @IBAction func didTapSignUp(_ sender: Any) {
        viewModel?.didTapSignUp()
    }
    
    // MARK: Other methods
    /// Initial setUp
    func setup() {
        errorMessageLabel.text = ""
        viewModel?.$error.sink(receiveValue: {[weak self] error in
            self?.errorMessageLabel.text = error
        }).store(in: &cancellable)
    }
}

