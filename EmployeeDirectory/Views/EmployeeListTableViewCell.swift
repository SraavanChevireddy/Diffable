//
//  EmployeeListTableViewCell.swift
//  EmployeeDirectory
//
//  Created by Nerella, Hanu Naga Mounika on 10/12/22.
//

import UIKit

class EmployeeListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var emailID: UILabel!
    @IBOutlet weak var teamInfo: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var employeeImage: UIImageView!
    
    var empInfo: Employee?{
        didSet{
            if let empInfo = empInfo {
                DispatchQueue.main.async {
                    self.emailID.text = empInfo.emailAddress
                    self.teamInfo.text = empInfo.team
                    self.summary.text = empInfo.biography
                    self.fullName.text = empInfo.fullName
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
