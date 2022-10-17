//
//  EmployeeListTableViewCell.swift
//  EmployeeDirectory
//
//  Created by Nerella, Hanu Naga Mounika on 10/12/22.
//

import UIKit
import Kingfisher

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
                    let processor = DownsamplingImageProcessor(size: self.employeeImage.bounds.size)
                                 |> RoundCornerImageProcessor(cornerRadius: 20)
                    self.employeeImage.kf.indicatorType = .activity
                    self.employeeImage.kf.setImage(
                        with: URL(string: empInfo.photoURLSmall)!,
                        placeholder: UIImage(named: "placeholderImage"),
                        options: [
                            .processor(processor),
                            .scaleFactor(UIScreen.main.scale),
                            .transition(.fade(1)),
                            .cacheOriginalImage
                        ])
                    {
                        result in
                        switch result {
                        case .success(let value):
                            print("Task done for: \(value.source.url?.absoluteString ?? "")")
                        case .failure(let error):
                            print("Job failed: \(error.localizedDescription)")
                        }
                    }
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
