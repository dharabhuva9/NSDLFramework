//
//  HomeVC.swift
//  TestNSDL
//
//  Created by Dhara Bhuva on 06/06/24.
//

import UIKit
import NSDLTestFramework

class HomeVC: UIViewController {
    // MARK: - IBOutlet Decaration

    @IBOutlet var lblDetails: UILabel!
    
    // MARK: - Variable Declaration
    
    // MARK: - Override methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction Methods
    @IBAction func btnCallPackagePressed(_ sender: Any) {
        self.lblDetails.text = ""
        //https://github.com/dharabhuva9/FrameworkNSDL.git
        let bundle = Bundle(for: UserDetailsVC.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        guard let userDetailsVC = storyboard.instantiateViewController(withIdentifier: "UserDetailsVC") as? UserDetailsVC else {
            return
        }
        userDetailsVC.delegate = self
        navigationController?.pushViewController(userDetailsVC, animated: true)
    }
}

// MARK: - UserDetailsDelegate Methods

extension HomeVC: UserDetailsDelegate {
    func getUserdetails(dic: ModelUser) {
        self.lblDetails.text = "Name: \(dic.firstName) \(dic.lastName) \nEmail: \(dic.email)"
    }
}
