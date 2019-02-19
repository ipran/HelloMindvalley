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
    @IBOutlet weak var idLabel: UILabel!
    
    var data: UserModel? {

        didSet {

            let imageString = data?.profile_image?.medium
            userImageView.cacheImage(urlString: imageString ?? "")
            idLabel.text = data?.id
            usernameLabel.text = data?.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

}
