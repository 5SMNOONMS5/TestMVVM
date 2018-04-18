//
//  CLSInstitutionViewController.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 25/11/2017.
//  Copyright © 2017 StephenChen. All rights reserved.
//

import UIKit

final class CLSInstitutionViewController: UIViewController {
    
    @IBOutlet weak var institutionTableView: UITableView!
    
    fileprivate var viewModel: CLSInstitutionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = CLSInstitutionViewModel(completion: { [unowned self] (isSuccess) in
            if (isSuccess) {
                cls_HighLightPrint(msg: "Success load")
                self.institutionTableView.delegate = self
                self.institutionTableView.dataSource = self
                self.institutionTableView.register(UINib(nibName: "CLSInstitutionTableViewCell", bundle: nil), forCellReuseIdentifier: CLSInstitutionTableViewCell.className)
            } else {
                cls_NegativePrint(msg: "Fail to load")
                self.showFialView()
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func showFialView() {
        /// fail view
    }
    
    @IBAction func actionClick(_ sender: Any) {
        /// do something
    }
}

// MARK: - TableviewDelegate
extension CLSInstitutionViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
}

// MARK: - UITableViewDataSource
extension CLSInstitutionViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.numberOfRows() ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel?.numberOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CLSInstitutionTableViewCell.className, for: indexPath) as! CLSInstitutionTableViewCell
        
        let row = indexPath.row
        
        cell.country.text = self.viewModel?.getCountry(index: row) ?? ""
        cell.name.text = self.viewModel?.getName(index: row) ?? ""
        cell.address.text = self.viewModel?.getAddress(index: row) ?? ""
        cell.phoneNumber.text = self.viewModel?.getPhoneNumber(index: row) ?? ""
        cell.applyList.text = self.viewModel?.getApplyLists(index: row) ?? ""
        cell.verifyDate.text = self.viewModel?.getVerifyDate(index: row) ?? ""
        cell.websiteURL.text = self.viewModel?.getWebsite(index: row) ?? ""
        
        return cell
    }
}

