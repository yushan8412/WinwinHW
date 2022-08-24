//
//  TableViewCell.swift
//  winwinHW
//
//  Created by Yushan Yang on 2022/8/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUi()
//        backgroundColor = .red
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUpUi() {
        userImage.anchor(top: topAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 16, width: 30, height: 30)
        userName.anchor(top: topAnchor, left: userImage.rightAnchor, paddingTop: 16, paddingLeft: 8)
        userImage.layer.cornerRadius = 15
        userImage.image = UIImage(named: "test")
        userImage.contentMode = .scaleAspectFill
        userImage.clipsToBounds = true
    }
    
}
