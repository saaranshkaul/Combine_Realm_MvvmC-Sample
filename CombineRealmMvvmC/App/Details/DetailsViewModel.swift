//
//  DetailsViewModel.swift
//  CombineRealmMvvmC
//
//  Created by Saaransh Kaul on 28/05/23.
//

import Foundation

class DetailsViewModel {
    
    weak var coordinator: LoginCoordinator?
    
    /// To Notify coordinator to Pop the ViewController
    func didTapLogout() {
        coordinator?.popDetailsView()
    }
}
