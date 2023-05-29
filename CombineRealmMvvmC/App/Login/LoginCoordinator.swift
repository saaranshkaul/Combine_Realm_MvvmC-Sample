//
//  LoginCoordinator.swift
//  CombineRealmMvvmC
//
//  Created by Saaransh Kaul on 28/05/23.
//

import UIKit

class LoginCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LoginViewController.instantiate()
        vc.viewModel = LoginViewModel.init()
        vc.viewModel?.coordinator = self
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(vc, animated: false)
    }
    
    /// To navigate to Sign Up screen by switching to Sign Up Coordinator and remove Login Cordinator
    func didTapSignUp() {
        (parentCoordinator as! AppCoordinator).goToSignUpScreen()
        (parentCoordinator as! AppCoordinator).childDismissed(self)
    }
    
    /// To navigate to Details Screen
    func goToDetailsScreen(userDetail: UserDetails) {
        let vc = DetailsViewController.instantiate()
        vc.viewModel = DetailsViewModel.init()
        vc.viewModel?.coordinator = self
        vc.userDetails = userDetail
        navigationController.pushViewController(vc, animated: false)
    }
    
    /// To navigate back to login Screen on logout action
    func popDetailsView() {
        navigationController.popViewController(animated: true)
        
    }
}
