//
//  CellTblUser.swift
//  TestFramework
//
//  Created by Dhara Bhuva on 06/06/24.
//

import UIKit

public class CellTblUser: UITableViewCell {

    //MARK: - IBOutlet Declaration
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    
    //MARK: - Override Methods
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
