//
//  SignUpViewModel.swift
//  CombineRealmMvvmC
//
//  Created by Saaransh Kaul on 28/05/23.
//

import Foundation
import RealmSwift

class SignUpViewModel {
    
    weak var coordinator: SignUpCoordinator?
    private var model = UserDetails()
    private let realm = try! Realm()
    
    /// To navigate to Login Screen
    func didTapLogin() {
        coordinator?.goToLogin()
    }
    
    /// To map all the Text filed entries to UserDetails object and proceed to say in  Local DB
    /// - Parameters:
    ///   - userName: user's name
    ///   - password: user's password
    ///   - location: user's location
    ///   - age: user's age
    ///   - marks: user's marks obtained
    ///   - major: user's education major
    func didTapSubmit(userName: String, password: String, location: String, age: String, marks: String, major: String) {
        model = UserDetails()
        model.userName = userName
        model.password = password
        model.location = location
        model.age = Int(age)
        model.marks = Int(marks)
        model.major = major
        saveToDB()
    }
    
    /// To save Data in DB and Navigate to required screen
    func saveToDB() {
        try! realm.write {
            realm.add(model)
            coordinator?.goToLogin()
        }
    }
}
