//
//  HomeTableViewCell.swift
//  MindValleyDemoApp
//
//  Created by Pranil on 2/14/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!

    var data: (name: String?, userImage: UIImage?) {

        didSet {

            userImageView.image = data.userImage
            usernameLabel.text = data.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

}
