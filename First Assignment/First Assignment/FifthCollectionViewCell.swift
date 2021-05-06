//
//  FifthCollectionViewCell.swift
//  First Assignment
//
//  Created by 김지수 on 2021/05/07.
//

import UIKit

class FifthCollectionViewCell: UICollectionViewCell {
    
    static let idetifier : String = "FifthCollectionViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    
    
    func setData(title : String, iconName : String){
        if let image = UIImage(named: iconName) {
            contentImage.image = image
        }
        nameLabel.text = title
    }
}
