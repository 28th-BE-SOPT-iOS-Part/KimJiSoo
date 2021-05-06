//
//  SoptTableViewCell.swift
//  First Assignment
//
//  Created by 김지수 on 2021/04/30.
//

import UIKit

class SoptTableViewCell: UITableViewCell {
    
    static let identifier : String = "SoptTableViewCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var state: UILabel!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(imageName : String, title : String, subtitle : String) {
        
            if let image = UIImage(named: imageName)
            {
                iconImageView.image = image
            }
            name.text = title
            state.text = subtitle
        }
}
