//
//  DetailsViewController.swift
//  CombineRealmMvvmC
//
//  Created by Saaransh Kaul on 28/05/23.
//

import UIKit

class DetailsViewController: UIViewController, Storyboarded {
    
    // MARK: IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var marksLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    // MARK: Variables
    var viewModel: DetailsViewModel?
    var userDetails: UserDetails?
    
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: IBAction
    /// Action to take on Logout button tap
    /// - Parameter sender: UIButton
    @IBAction func didTapLogout(_ sender: Any) {
        viewModel?.didTapLogout()
    }
    
    // MARK: Other methods
    /// Initial setUp
    func setup() {
        nameLabel.text = userDetails?.userName
        majorLabel.text = userDetails?.major
        locationLabel.text = userDetails?.location
        if let marks = userDetails?.marks, let age = userDetails?.age {
            marksLabel.text = "\(marks)"
            ageLabel.text = "\(age)"
        }
    }
}
