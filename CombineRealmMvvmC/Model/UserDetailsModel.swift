//
//  UserDetailsModel.swift
//  CombineRealmMvvmC
//
//  Created by Saaransh Kaul on 28/05/23.
//
import RealmSwift
import Foundation

class UserDetails: Object {
    
    @Persisted var userName: String?
    @Persisted var password: String?
    @Persisted var location: String?
    @Persisted var major: String?
    @Persisted var age: Int?
    @Persisted var marks: Int?
}
