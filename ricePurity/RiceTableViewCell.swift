//
//  RiceCollectionViewCell.swift
//  ricePurity
//
//  Created by Levi Walsh on 7/12/17.
//  Copyright © 2017 Levi Walsh. All rights reserved.
//

import UIKit

class RiceTableViewCell: UITableViewCell {
    var riceLabel: UILabel!
    var button: UIButton!
    var state = false
    var delegate: RiceCollectionViewCellDelegate? = nil
    
    override func awakeFromNib() {
        
        // TODO change this to a checkbox
        button = UIButton(frame: CGRect(x: contentView.frame.height * (1/4), y: contentView.frame.height * (1/4), width: frame.height * (1/2), height: frame.height * (1/2)))
        
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        button.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        contentView.addSubview(button)
        
        riceLabel = UILabel(frame: CGRect(x: button.frame.maxX + 10, y: 0, width: frame.width - button.frame.maxX - 10, height: frame.height))
        riceLabel.center = CGPoint(x: riceLabel.center.x, y: contentView.center.y)
        contentView.addSubview(riceLabel)
    }
    
    func changeColor() {
        // TODO Change to image with checkmark
        delegate?.changeColorOfButton(forCell: self, state: state)
    }

}

protocol RiceCollectionViewCellDelegate {
    func changeColorOfButton(forCell: RiceTableViewCell, state: Bool)
}
