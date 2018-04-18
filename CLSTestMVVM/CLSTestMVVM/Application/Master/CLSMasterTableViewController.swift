//
//  CLSMasterTableViewController.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 02/10/2017.
//  Copyright © 2017 StephenChen. All rights reserved.
//

import UIKit

class CLSMasterTableViewController: UITableViewController {

    var masterViewModel: CLSMasterViewModel = CLSMasterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.className)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - TableviewDelegate
extension CLSMasterTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: self.masterViewModel.getController(index: indexPath.row))
        detailVC?.title = self.masterViewModel.getTitle(index: indexPath.row)
        self.navigationController?.pushViewController(detailVC!, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension CLSMasterTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.masterViewModel.numberOfRows()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.masterViewModel.numberOfSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className, for: indexPath)
        cell.textLabel?.text = self.masterViewModel.getTitle(index: indexPath.row)
        return cell
    }
}









