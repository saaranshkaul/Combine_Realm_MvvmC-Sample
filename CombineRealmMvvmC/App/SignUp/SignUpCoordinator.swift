//
//  SignUpCoordinator.swift
//  CombineRealmMvvmC
//
//  Created by Saaransh Kaul on 28/05/23.
//

import UIKit

class SignUpCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SignUpViewController.instantiate()
        vc.viewModel = SignUpViewModel.init()
        vc.viewModel?.coordinator = self
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(vc, animated: false)
        
    }
    
    /// To navigate to login screen by switching to login Coordinator and remove signup Cordinator
    func goToLogin() {
        (parentCoordinator as! AppCoordinator).goToLoginScreen()
        (parentCoordinator as! AppCoordinator).childDismissed(self)
    }
    
    /// To navigate to Sign Up Screen
    func goToDetailsScreen() {
        goToLogin()
    }
}


