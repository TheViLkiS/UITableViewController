//
//  ViewController.swift
//  UITableViewController
//
//  Created by Дмитрий Гусев on 18.03.2023.
//

import UIKit

class ViewController: UIViewController {

    let tableViewController = UITableViewController(style: .plain)
    
    var refresh = UIRefreshControl()
    
    
    var allTime = [Date]()
    var cellIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
        
        refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        refresh.tintColor = .red
        view.addSubview(tableViewController.tableView)
        tableViewController.tableView.addSubview(refresh)
    }

    
    @objc func handleRefresh() {
        allTime.append(Date())
        refresh.endRefreshing()
        let indexPathNewRow = IndexPath(row: allTime.count - 1, section: 0)
        tableViewController.tableView.insertRows(at: [indexPathNewRow], with: .automatic)
    }
    
    func createTableView() {
        tableViewController.tableView = UITableView(frame: view.bounds, style: .plain)
        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let date = allTime[indexPath.row]
        cell.textLabel?.text = "\(date)"
        
        return cell
    }
    
    
}
