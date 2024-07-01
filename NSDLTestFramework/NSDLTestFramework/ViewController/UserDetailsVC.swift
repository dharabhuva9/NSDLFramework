//
//  UserDetailsVC.swift
//  TestFramework
//
//  Created by Dhara Bhuva on 06/06/24.
//

import UIKit

public protocol UserDetailsDelegate {
    func getUserdetails(dic: ModelUser)
}

public class UserDetailsVC: UIViewController {
    // MARK: - IBOutlet Declaration

    @IBOutlet var tblList: UITableView!
    
    // MARK: - Variable Declaration

    var objList: [ModelUser] = []
    public var delegate: UserDetailsDelegate?
    
    // MARK: - Override methods

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.doInitialSettings()
    }
    
    public static func instantiateFromFramework() -> UserDetailsVC {
        let bundle = Bundle(for: UserDetailsVC.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: "UserDetailsVC") as! UserDetailsVC
    }
    
    // MARK: - Custom Class methods

    func doInitialSettings() {
        self.tblList.delegate = self
        self.tblList.dataSource = self
        
        let bundle = Bundle(for: UserDetailsVC.self)
        self.tblList.register(UINib(nibName: "CellTblUser", bundle: bundle), forCellReuseIdentifier: "CellTblUser")
        
        self.getUserData()
    }
    
    // MARK: - IBAction Methods

    @IBAction func btnReturnPressed(_ sender: Any) {
        if !self.objList.isEmpty {
            self.delegate?.getUserdetails(dic: self.objList[0])
        }
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource Methods

extension UserDetailsVC: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tblList.dequeueReusableCell(withIdentifier: "CellTblUser") as? CellTblUser else {
            return UITableViewCell()
        }
        let dic = self.objList[indexPath.row]
        cell.lblEmail.text = dic.email
        cell.lblName.text = "\(dic.firstName) \(dic.lastName)"
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !self.objList.isEmpty {
            self.delegate?.getUserdetails(dic: self.objList[indexPath.row])
        }
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Api Calling

extension UserDetailsVC {
    func getUserData() {
        let urlString = "https://reqres.in/api/users?page=1"
        NetworkManager.shared.fetchData(from: urlString) { (result: Result<ModelUserDetails, Error>) in
            switch result {
            case .success(let responseData):
                self.objList = responseData.data
                DispatchQueue.main.async {
                    self.tblList.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch data: \(error.localizedDescription)")
            }
        }
    }
}
