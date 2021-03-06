//
//  ViewController.swift
//  MindValleyDemoApp
//
//  Created by Pranil on 2/12/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlet Connection
    @IBOutlet weak var tableView: UITableView!
    // Declarations
    var listOfData: [ServerResponse] = []

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register NoDataTableViewCell Xib file
        self.tableView.register(UINib(nibName: "NoDataTableViewCell", bundle: nil), forCellReuseIdentifier: "NoDataTableViewCell")
        showActivityIndicator()
        configureView()
        loadData()
    }
}




// MARK: - General Functions
extension ViewController {

    func loadData() {
        // Load data from server
        DataManager.shared.fetchServerData { (status, message, serverResponse) in

            if status {

                self.listOfData = serverResponse
                self.refresh()
            }
        }
    }

    func configureView() {

        navigationItem.title = "Users"
    }

    func refresh() {

        hideActivityIndicator()
        DispatchQueue.main.async {

            self.tableView.reloadData()
        }
    }
}




// MARK: - Tableview Related
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

        if listOfData.count > 0 {

            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as! HomeTableViewCell
            var user = UserModel()
            user.name = listOfData[indexPath.row].user?.name
            user.id = listOfData[indexPath.row].user?.id
            user.profile_image = listOfData[indexPath.row].user?.profile_image
            cell.data = user
            return cell
        }
        else {

            let cell = tableView.dequeueReusableCell(withIdentifier: NoDataTableViewCell.identifier) as! NoDataTableViewCell
            return cell
        }
    }
}
