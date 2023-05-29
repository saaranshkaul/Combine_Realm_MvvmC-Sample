//
//  AppCoordinator.swift
//  CombineRealmMvvmC
//
//  Created by Saaransh Kaul on 28/05/23.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    //To initiate navigation
    func start()
}

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToLoginScreen()
    }
    
    /// To navigate to Login Screen
    func goToLoginScreen() {
        let child = LoginCoordinator.init(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    /// To navigate to Sign Up Screen
    func goToSignUpScreen() {
        let child = SignUpCoordinator.init(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    /// To remove child Coordinators from child Coordinators array after use
    /// - Parameter child: The Child Coordinators to be removed from array of child Coordinators
    func childDismissed(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
