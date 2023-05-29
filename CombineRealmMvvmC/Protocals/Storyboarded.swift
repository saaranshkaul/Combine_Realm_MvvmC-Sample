//
//  Storyboarded.swift
//  CombineRealmMvvmC
//
//  Created by Saaransh Kaul on 28/05/23.
//

import UIKit

protocol Storyboarded {
   static func instantiate() -> Self
}

extension Storyboarded {
    
    static func instantiate() -> Self {
        let identifier = String(describing: self)
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: identifier) as! Self
        return viewController
    }
}
