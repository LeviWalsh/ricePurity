//
//  RiceCollectionViewCell.swift
//  ricePurity
//
//  Created by Levi Walsh on 7/12/17.
//  Copyright © 2017 Levi Walsh. All rights reserved.
//

import UIKit

class RiceCollectionViewCell: UICollectionViewCell {
    var riceImageView: UIImageView!
    var button: UIButton!
    var delegate: RiceCollectionViewCellDelegate? = nil
    
    override func awakeFromNib() {
        riceImageView = UIImageView(frame: contentView.frame)
        riceImageView.contentMode = .scaleAspectFill
        riceImageView.clipsToBounds = true
        contentView.addSubview(riceImageView) // Add UI elements to the contentView not to the cell itself
        
        button = UIButton(frame: CGRect(x: contentView.frame.width / 2, y: contentView.frame.height / 2, width: frame.width / 6, height: frame.height / 6))
        button.backgroundColor = UIColor.orange
        button.setTitle("Change my Color", for: .normal)
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        contentView.addSubview(button)
    }
    
    func changeColor() {
        delegate?.changeColorOfButton(forCell: self)
    }

}

protocol RiceCollectionViewCellDelegate {
    func changeColorOfButton(forCell: RiceCollectionViewCell)
}
