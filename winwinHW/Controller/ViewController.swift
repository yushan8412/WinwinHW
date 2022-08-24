//
//  ViewController.swift
//  winwinHW
//
//  Created by Yushan Yang on 2022/8/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    var tableView = UITableView()
    var winwinData: Winwin? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil),
                                forCellReuseIdentifier: "TableViewCell")

        setUpTableView()
        tableView.dataSource = self
        tableView.delegate = self
        getData()
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func getData() {
        WinwinManager.shared.getData { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let winwin):
                self?.winwinData = winwin
                print("get data")
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return winwinData?.data.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "TableViewCell") as? TableViewCell else { return UITableViewCell()}
        guard let winwinData = winwinData else { return UITableViewCell()}
//        cell.userImage.kf.setImage(with: URL(string: winwinData.data.items[indexPath.row].user.imageUrl))
        cell.userName.text = winwinData.data.items[indexPath.row].user.nickName
        return cell
    }
    
    
    
}

