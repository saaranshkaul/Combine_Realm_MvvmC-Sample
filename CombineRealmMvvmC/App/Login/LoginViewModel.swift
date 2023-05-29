//
//  LoginViewModel.swift
//  CombineRealmMvvmC
//
//  Created by Saaransh Kaul on 28/05/23.
//

import Foundation
import RealmSwift

class LoginViewModel {
    
    weak var coordinator: LoginCoordinator?
   private var realm = try!Realm()
    @Published var error: String?
    
    /// To navigate to Sign Up screen
    func didTapSignUp() {
        coordinator?.didTapSignUp()
    }
    
    
    /// To verify credentials and proceed forward
    /// - Parameters:
    ///   - username: User's user name
    ///   - password: User's current password
    func verifyCredentials(_ username: String, _ password: String) {
        var flag = false
        var loggedInUserDetail = UserDetails()
        let userDetails = realm.objects(UserDetails.self)
        for userDetail in userDetails {
            if userDetail.userName == username && userDetail.password == password {
                flag = true
                loggedInUserDetail = userDetail
                break
            }
        }
        error = flag ? nil : "Invalid Credentials"
        error == nil ? (coordinator?.goToDetailsScreen(userDetail: loggedInUserDetail)) : ()
   }
    
}
