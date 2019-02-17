//
//  ViewController.swift
//  MindValleyDemoApp
//
//  Created by Pranil on 2/12/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var listOfData: [ServerResponse] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }

    func loadData() {
        // Load data from server
        DataManager.shared.fetchServerData { (status, message, serverResponse) in

            if status {

                self.listOfData = serverResponse
            }
        }
    }

}

extension ViewController: UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if listOfData.count > 0 {

            return listOfData.count
        }
        else {

            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as! HomeTableViewCell
        let name = listOfData[indexPath.row].user?.name
//        let userImage = listOfData[indexPath.row].user?.profile_image?.medium
        let userImage = UIImage()
        cell.data = (name, userImage)
        return cell
    }
}
